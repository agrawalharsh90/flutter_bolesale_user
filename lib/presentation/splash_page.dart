import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/display_product_widget.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/presentation/login_page.dart';
import 'package:grocery/presentation/user_details_edit.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(200),
              child: Center(
                child: Image.asset(
                  Styles.APP_LOGO,
                  height: ScreenUtil.instance.setWidth(120),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Welcome to Bolesale",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "India's B2B Marketplace\n\n\n\n\n\nWe connect Manufacturers, Wholesalers and Traders with Retailers and Resellers all over India.",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
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
    LoggedInUser loggedInUser = await preferenceService.getAuthUser();
    if (loggedInUser != null) {
      print("logged in user");
      print(LoggedInUser.toJson(loggedInUser));
      await Provider.of<UserStore>(context).setLoggedIn(loggedInUser);
      if (loggedInUser.name == null ||
          loggedInUser.name.isEmpty ||
          loggedInUser.phoneNumber == null ||
          loggedInUser.phoneNumber.isEmpty) {
        _navigateToEditUserPage(context);
        return;
      }
      bool locationPermission = await _locationPermission();
      if (locationPermission)
        await Provider.of<AddressStore>(context).getAddress();
      Map<String, String> url = await dynamicLinkService.handleDynamicLinks();
      print("#####");
      print(url);
      if (url != null && url.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DisplayProductWidget(
              productId: url['productId'],
              catId: url['categoryId'],
              subCatId: url['subCategoryId'],
            ),
          ),
        );
        return;
      }
      _navigateToHomePage(context);
    } else {
      _navigateToLoginPage(context);
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

  _navigateToLoginPage(context) {
    Navigator.pushReplacementNamed(context, LoginPage.routeNamed);
  }

  _navigateToEditUserPage(context) {
    Navigator.pushReplacementNamed(context, UserDetailsEdit.routeNamed);
  }

  _navigateToHomePage(context) {
    Navigator.pushReplacementNamed(context, HomePage.routeNamed,
        arguments: ScreenArguments(currentPage: 0));
  }
}
