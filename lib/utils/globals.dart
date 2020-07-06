import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/model/grocery_error.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_dialog.dart';
import 'package:grocery/services/firebase_auth_service.dart';
import 'package:grocery/services/firebase_services.dart';
import 'package:grocery/services/get_product_service.dart';
import 'package:grocery/services/location_service.dart';
import 'package:grocery/services/offer_service.dart';
import 'package:grocery/services/order_service.dart';
import 'package:grocery/services/prefrence_service.dart';
import 'package:grocery/services/user_service.dart';
import 'package:grocery/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

FirebaseAuthService firebaseAuthService = FirebaseAuthService.getInstance();
FirebaseService firebaseService = FirebaseService.getInstance();
PreferenceService preferenceService = PreferenceService.getInstance();
UserService userService = UserService.getInstance();
GetProductService getProductService = GetProductService.getInstance();
OrderService orderService = OrderService.getInstance();
LocationService locationService = LocationService.getInstance();
OfferService offerService = OfferService.getInstance();

bool validateEmail(String email) {
  if (!requiredString(email)) {
    return false;
  }
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(email)) ? false : true;
}

bool requiredString(String value) {
  if (value == null || value.isEmpty) return false;
  return true;
}

bool checkPassword(String password) {
  if (requiredString(password) && password.length >= 6) {
    return true;
  }
  return false;
}

Widget showSnackbar(
  String text,
  BuildContext context,
) {
  if (context != null) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
          ),
          backgroundColor: Styles.BLACK_COLOR,
          duration: Duration(milliseconds: 2500),
        ),
      );
  } else {
    return SizedBox();
  }
}

showErrorSnackBar(var e, BuildContext context, {String message}) {
  if (e.runtimeType == SocketException) {
    showSnackbar("NO INTERNET CONNECTION", context);
    return;
  }
  if (e.runtimeType != GroceryError) {
    showSnackbar(message ?? e.toString(), context);
    return;
  } else {
    if (e.error != null)
      showSnackbar(e.error, context);
    else {
      String text = '';
      e.errors.forEach((Map v) {
        text += v.values.toList()[0] + '\n';
      });
      showSnackbar(text, context);
    }
  }
}

getTitleTex(text,
    {double fontSize = 22,
    TextAlign textAlign = TextAlign.left,
    Color textColor = Styles.GREY_COLOR}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: ScreenUtil.instance.setWidth(20),
      vertical: ScreenUtil.instance.setHeight(5),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: fontSize, color: textColor),
      textAlign: textAlign,
    ),
  );
}

urlLauncher(String data, context) async {
  String url;
  if (data.contains('@')) {
    url = "mailto:$data";
  } else if (data.contains(
      new RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$'))) {
    url = "tel:$data";
  }

  if (url != null) {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showSnackbar("Can't open", context);
    }
  }
}

customProductDialog({Product product, BuildContext context, Function onAdd}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(
          product: product,
          onAdd: onAdd,
          buttonText: 'Add To Cart',
        );
      });
}
showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 15,
      backgroundColor: Styles.GREY_COLOR,
      textColor: Styles.WHITE_COLOR);
}

errorDialog(String msg, context) {
  print("Show dialog");
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ScreenUtil.instance.setWidth(20))),
          title: Container(
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(20)),
            child: Text(
              msg,
              style: TextStyle(color: Styles.BLACK_COLOR, fontSize: 20),
            ),
          ),
        );
      });
}
