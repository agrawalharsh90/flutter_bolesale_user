import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:pe_paytm/order.dart';
import 'package:pe_paytm/payment_screen.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  double totalAmount;
  Map data;
  String address;

  PaymentPage({this.data, this.totalAmount, this.address});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Payment',
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(30),
            vertical: ScreenUtil.instance.setHeight(20)),
        child: Column(
          children: <Widget>[
            checkBox(selected == 0, "COD", 0),
            SizedBox(
              height: ScreenUtil.instance.setHeight(20),
            ),
            checkBox(selected == 1, "Online Payment", 1),
            Expanded(child: SizedBox()),
            StoreObserver<OrderStore>(
              builder: (OrderStore orderStore, BuildContext context) {
                return CustomButton(
                  text: "Confirm Order",
                  isLoading: orderStore.isLoading,
                  onTap: () {
                    if (selected == 1) {
                     
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                    onSuccessfull: () {
                                      print("on successfull");
                                      onPaymentDone(widget.data, context, true);
                                    },
                                    onFailed: () {
                                      print("on failed");
                                      Navigator.of(context).pop();
//                                              errorDialog(
//                                                  "Payment Failed!!\nIf amount deducted it will be refunded soon.\nFor any quiry Please contact US.",
//                                                  context);
                                    },
                                    paymentURL:
                                        "https://us-central1-payments-testing-5fc15.cloudfunctions.net/customFunctions/payment",
                                    order: Order(
                                        amount: widget.totalAmount.toString(),
                                        orderId: DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        phoneNumber:
                                            Provider.of<UserStore>(context)
                                                .loggedInUser
                                                .phoneNumber,
                                        custId: 'CUST123456',
                                        email: 'test123@gmail.com'),
                                  )));
                    } else {
                      onPaymentDone(widget.data, context, false);
                    }
                  },
                  horizontalMargin: 0,
                  verticalMargin: 40,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  checkBox(bool isSelect, String text, int pa) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = pa;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setWidth(20),
            width: ScreenUtil.instance.setWidth(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.5),
                color: isSelect ? Styles.PRIMARY_COLOR : Styles.WHITE_COLOR),
          ),
          Text(text)
        ],
      ),
    );
  }

  onPaymentDone(Map cartMap, context, bool paid) async {
    Map<String, dynamic> data = {};
    cartMap.forEach((key, value) {
      Map<String, dynamic> products = {};
      value.forEach((key, value) {
        products.addAll({key: Product.toJson(value)});
      });
      data.addAll({
        key: products,
        'paid': paid,
        'address': widget.address,
        'totalAmount': widget.totalAmount
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
