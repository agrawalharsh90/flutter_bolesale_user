import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/presentation/phone_auth_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  static const String routeNamed = 'SplashPage';

  double defaultHeight = 798;
  double defaultWidth = 412;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: defaultWidth, height: defaultHeight, allowFontScaling: true)
      ..init(context);
    checkUser(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      ),
    );
  }

  checkUser(context) async {
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
