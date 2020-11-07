import 'package:flutter/material.dart';
import 'package:grocery/model/address.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/order_details.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Cart',
      showbackArrow: false,
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AddressEditPage.routeNamed);
            },
            child: IgnorePointer(
              child: StoreObserver<AddressStore>(
                builder: (AddressStore addressStore, BuildContext context) {
                  return SearchBar(
                    horizontalMargin: 20,
                    hintText: addressStore.address == null
                        ? "Select Delivery Location"
                        : addressStore.address.addressString,
                    icon: Icons.location_on,
                    onSearch: (value) {
                      print(value);
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: StoreObserver<CartStore>(
              builder: (CartStore cartStore, BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, BasketPage.routeNamed);
                      },
                      child: OrderDetails(
                        items: cartStore.totalItems,
                        total: cartStore.totalAmount,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Styles.RED_COLOR),
                          borderRadius: BorderRadius.circular(15)),
                      child: getTitleTex(
                          'The Shipping Charges and Confirmation of the Order will be provided via WhatsApp',
                          textColor: Styles.BLACK_COLOR,
                          textAlign: TextAlign.center),
                    ),
                    cartStore.totalAmount > 0
                        ? StoreObserver<OrderStore>(
                            builder:
                                (OrderStore orderStore, BuildContext context) {
                              return CustomButton(
                                text: "Confirm Order",
                                isLoading: orderStore.isLoading,
                                onTap: () {
                                  Address address =
                                      Provider.of<AddressStore>(context)
                                          .address;
                                  if (address == null) {
                                    showSnackbar(
                                        "Please Provide Delivery Location",
                                        context);
                                    return;
                                  }
                                  onConfirm(
                                      cartStore.cartMap,
                                      context,
                                      address.addressString,
                                      cartStore.totalAmount);
                                },
                                horizontalMargin: 30,
                                verticalMargin: 40,
                              );
                            },
                          )
                        : SizedBox(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  onConfirm(Map cartMap, context, String address, double totalAmount) async {
    Map<String, dynamic> data = {};
    cartMap.forEach((key, value) {
      Map<String, dynamic> products = {};
      value.forEach((key, value) {
        products.addAll({key: Product.toJson(value)});
      });
      data.addAll({
        key: products,
        'paid': false,
        'address': address,
        'totalAmount': totalAmount
      });
    });
    try {
      await Provider.of<OrderStore>(context).postComboRequest(data);
      print("data udated");
      await Provider.of<CartStore>(context).clearStore();
      print("store cleared");
      showToast("Your Order Has been Recorded");
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomePage.routeNamed, (route) => false,
          arguments: ScreenArguments(currentPage: 0));
    } catch (e) {
      showSnackbar("Please try again later", context);
    }
  }
}
