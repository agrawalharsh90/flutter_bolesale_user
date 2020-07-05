import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/address.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/category_pages/raw_non_veg/raw_non_veg_payment.dart';
import 'package:grocery/presentation/category_pages/raw_non_veg/raw_non_veg_vendor_page.dart';
import 'package:grocery/presentation/custom/count_row.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class RawNonVegBasketPage extends StatefulWidget {
  Map<String, Product> data;

  RawNonVegBasketPage({this.data});

  @override
  _RawNonVegBasketPageState createState() => _RawNonVegBasketPageState();
}

class _RawNonVegBasketPageState extends State<RawNonVegBasketPage> {
  ScrollController controller = ScrollController();
  Vendor selectedVendor;
  bool wantsVideoCall = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Basket',
      body: widget.data.isEmpty
          ? Center(
              child: getTitleTex('No Items Added'),
            )
          : Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AddressEditPage.routeNamed);
                  },
                  child: IgnorePointer(
                    child: StoreObserver<AddressStore>(
                      builder:
                          (AddressStore addressStore, BuildContext context) {
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, index) {
                        return getListWidget(
                            'Raw Non Veg', widget.data.values.toList());
                      }),
                ),
                Card(
                  elevation: 8,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        wantsVideoCall = !wantsVideoCall;
                      });
                    },
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: ScreenUtil.instance.setHeight(50)),
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil.instance.setHeight(10),
                        horizontal: ScreenUtil.instance.setWidth(20),
                      ),
                      decoration: BoxDecoration(
                        color: Styles.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: ScreenUtil.instance
                          .setWidth(ScreenUtil.instance.width),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: ScreenUtil.instance.setWidth(30),
                            width: ScreenUtil.instance.setWidth(30),
                            decoration: BoxDecoration(
                                color: wantsVideoCall
                                    ? Styles.PRIMARY_COLOR
                                    : Styles.WHITE_COLOR,
                                border:
                                    Border.all(color: Styles.PRIMARY_COLOR)),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              color: Styles.WHITE_COLOR,
                            )),
                          ),
                          Text("Wants Video Call")
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  verticalMargin: 50,
                  elevation: 5,
                  imageUrl: selectedVendor == null
                      ? Styles.MO_CONTACT_US
                      : selectedVendor.imageUrl,
                  text: selectedVendor == null
                      ? 'Select Vendors'
                      : selectedVendor.name,
                  textColor: Styles.BLACK_COLOR,
                  isImageCircle: true,
                  buttonColor: Styles.WHITE_COLOR,
                  alignment: MainAxisAlignment.spaceAround,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RawNonVegVendorPage(
                                  data: widget.data,
                                ))).then((value) {
                      if (value != null && value.runtimeType == Vendor) {
                        setState(() {
                          selectedVendor = value;
                        });
                      }
                    });
                  },
                ),
                selectedVendor == null
                    ? SizedBox()
                    : CustomButton(
                        text: "Checkout",
                        onTap: () {
                          Address address =
                              Provider.of<AddressStore>(context).address;
                          if (address == null) {
                            showToast("Please Provide Delivery Location");
                            return;
                          }

                          Map<String, dynamic> orderData =
                              Map<String, dynamic>();
                          orderData.addAll({'orders': []});
                          widget.data.forEach((key, value) {
                            orderData['orders']
                                .add({key: Product.toJson(value)});
                          });
                          double total = totalAmount();
                          orderData.addAll({
                            'vendorId': selectedVendor.id,
                            'vendor': Vendor.toJson(selectedVendor),
                            'totalAmount': total,
                            'address': address.addressString,
                            'wantsVideoCall': wantsVideoCall
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RawNonVegPaymentPage(
                                        data: orderData,
                                        totalAmount: total,
                                      )));
                        },
                        horizontalMargin: 30,
                        verticalMargin: 20,
                      ),
              ],
            ),
    );
  }

  getListWidget(String title, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitleTex(title),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: controller,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return CountRow(
                title: productList[index].name,
                imageUrl: productList[index].imageUrl,
                suffixText: "Rs." +
                    (double.parse(productList[index].price) *
                            productList[index].quantity)
                        .toString(),
                initialCount: productList[index].quantity,
                verticalMargin: 10,
                onCountChange: (v) {
                  Product product = productList[index];
                  product.quantity = v;
                  Provider.of<CartStore>(context).updateCartMap({
                    title: {product.name: product}
                  });
                },
              );
            }),
      ],
    );
  }

  totalAmount() {
    double amount = 0;
    widget.data.forEach((key, value) {
      amount = amount + (double.parse(value.price) * value.quantity);
    });
    return amount;
  }
}
