import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/model/grocery_error.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/display_product_widget.dart';
import 'package:grocery/services/dynamic_link_service.dart';
import 'package:grocery/services/firebase_services.dart';
import 'package:grocery/services/get_product_service.dart';
import 'package:grocery/services/location_service.dart';
import 'package:grocery/services/offer_service.dart';
import 'package:grocery/services/order_service.dart';
import 'package:grocery/services/prefrence_service.dart';
import 'package:grocery/services/request_service.dart';
import 'package:grocery/services/user_service.dart';
import 'package:grocery/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

FirebaseService firebaseService = FirebaseService.getInstance();
PreferenceService preferenceService = PreferenceService.getInstance();
UserService userService = UserService.getInstance();
GetProductService getProductService = GetProductService.getInstance();
OrderService orderService = OrderService.getInstance();
LocationService locationService = LocationService.getInstance();
OfferService offerService = OfferService.getInstance();
RequestService requestService = RequestService.getInstance();
FirebaseMessaging firebaseMessaging = FirebaseMessaging();
DynamicLinkService dynamicLinkService = DynamicLinkService.getInstance();
GetIt locator = GetIt.instance;

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
    Color textColor = Styles.GREY_COLOR,
    double width}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: ScreenUtil.instance.setWidth(20),
      vertical: ScreenUtil.instance.setHeight(5),
    ),
    width: ScreenUtil.instance.setWidth(width ?? ScreenUtil.instance.width),
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

navigateToDisplayProductWidget(
    {Product product, BuildContext context}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => DisplayProductWidget(
              product: product, initialCount: int.parse(product.moq))));
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

imageWidget({String imgUrl, BoxFit boxFit = BoxFit.contain, Color imageColor}) {
  return imgUrl.contains('http')
      ? CachedNetworkImage(
          imageUrl: imgUrl,
          fit: boxFit,
          color: imageColor,
          placeholder: (context, s) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            );
          },
          errorWidget: (context, s, o) {
            return Center(
              child: Icon(Icons.error_outline),
            );
          },
        )
      : Image.asset(
          imgUrl,
          fit: boxFit,
          color: imageColor,
        );
}

hideKeyboard(
    {BuildContext context,
    bool hideTextInput = true,
    bool requestFocusNode = true}) {
  if (hideTextInput) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
  if (context != null && requestFocusNode) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
