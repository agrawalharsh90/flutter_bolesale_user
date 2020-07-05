import 'package:flutter/material.dart';
import 'package:grocery/model/address.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/order_details.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/payment_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
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
                    cartStore.totalAmount > 0
                        ? CustomButton(
                            text: "Proceed To Pay",
                            onTap: () {
                              Address address =
                                  Provider.of<AddressStore>(context).address;
                              if (address == null) {
                                showSnackbar("Please Provide Delivery Location",
                                    context);
                                return;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                    totalAmount: cartStore.totalAmount,
                                    data: cartStore.cartMap,
                                    address: address.addressString,
                                  ),
                                ),
                              );
                            },
                            horizontalMargin: 30,
                            verticalMargin: 40,
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
}
