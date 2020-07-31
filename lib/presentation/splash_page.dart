import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/presentation/phone_auth_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = 'SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double defaultHeight = 798;
  double defaultWidth = 412;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: defaultWidth, height: defaultHeight, allowFontScaling: true)
      ..init(context);

    return CustomScaffold(
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(280),
              child: Center(
                child: Image.asset(
                  Styles.APP_LOGO,
                  height: ScreenUtil.instance.setWidth(120),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(20),
            ),
            Text(
              "Bolesale: India's B2B Marketplace",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(20),
            ),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkUser() async {
    User loggedInUser = await preferenceService.getAuthUser();
    if (loggedInUser != null) {
      print("logged in user");
      print(User.toJson(loggedInUser));
      await Provider.of<UserStore>(context).setLoggedIn(loggedInUser);
      bool locationPermission = await _locationPermission();
      if (locationPermission)
        await Provider.of<AddressStore>(context).getAddress();
      _navigateToHomePage(context);
    } else {
      _navigateToPhoneAuthPage(context);
    }
  }

  Future<bool> _locationPermission() async {
    print("check location permission");
    PermissionStatus checkPermission =
        await LocationPermissions().checkPermissionStatus();
    print(checkPermission.toString());
    if (checkPermission != PermissionStatus.granted) {
      print("check location permission");
      PermissionStatus permission =
          await LocationPermissions().requestPermissions();
      print(permission.toString());
      if (permission == PermissionStatus.granted)
        return true;
      else
        return false;
    } else {
      return true;
    }
  }

  _navigateToPhoneAuthPage(context) {
    Navigator.pushReplacementNamed(context, PhoneAuthPage.routeNamed);
  }

  _navigateToHomePage(context) {
    Navigator.pushReplacementNamed(context, HomePage.routeNamed,
        arguments: ScreenArguments(currentPage: 0));
  }
}
