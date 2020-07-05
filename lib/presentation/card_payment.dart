import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/utils/styles.dart';

class Cardpayment extends StatefulWidget {
  static const String routeNamed = 'Cardpayment';

  @override
  _CardpaymentState createState() => _CardpaymentState();
}

class _CardpaymentState extends State<Cardpayment> {
  bool saveCard = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        saveCard = newValue;

        if (saveCard) {
        } else {}
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.WHITE_COLOR,
        appBar: AppBar(
          backgroundColor: Styles.WHITE_COLOR,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Styles.BLACK_COLOR),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Payment",
            style: TextStyle(color: Styles.BLACK_COLOR),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.instance.setHeight(20),
                horizontal: ScreenUtil.instance.setWidth(30)),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CARD NUMBER")),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(10),
                ),
                custom_input(double.infinity, true, "Password"),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(20),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil.instance.setWidth(60)),
                      child: Text("EXPIRE DATE"),
                    ),
                    Text("CVV")
                  ],
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(10),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: ScreenUtil.instance.setWidth(60),
                      ),
                      child: custom_input(100.0, false, "05 / 21"),
                    ),
                    custom_input(80.0, false, "123"),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(30),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CARDHOLDER NAME")),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(10),
                ),
                custom_input(double.infinity, false, "John Doe"),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(20),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(value: saveCard, onChanged: _onRememberMeChanged),
                    Text("SAVE CARD")
                  ],
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(20),
                ),
                CustomButton(
                  text: "Confirm",
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(20),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Saved Cards",
                      style: TextStyle(color: Styles.GREY_COLOR, fontSize: 18),
                    )),
              ],
            ),
          ),
        ));
  }

  custom_input(size, obsure, hint) {
    return Container(
      width: size,
      color: Styles.WHITE_COLOR,
      child: Material(
        elevation: 10.0,
        child: TextFormField(
          obscureText: obsure,
          autofocus: false,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Styles.WHITE_COLOR,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.instance.setWidth(20),
                  vertical: ScreenUtil.instance.setHeight(10)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      BorderSide(color: Styles.WHITE_COLOR, width: 3.0))),
        ),
      ),
    );
  }
}
