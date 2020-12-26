import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class LoginPage extends StatelessWidget {
  static const String routeNamed = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return StoreObserver<UserStore>(
      builder: (UserStore userStore, BuildContext context) {
        return CustomScaffold(
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: true,
            context: context,
            body: Column(
              children: <Widget>[
                logoContainer(),
                Expanded(
                  child: loginWidget(userStore, context),
                ),
              ],
            ));
      },
    );
  }

  loginWidget(UserStore userStore, context) {
    return Container(
      key: Key('LOGIN'),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
          CustomButton(
            isLoading: userStore.isLoading,
            text: "Continue with Google",
            onTap: () async {
              try {
                await userStore.loginWithGoogle();
                _navigateToSplashPage(context);
              } catch (e) {
                print("error in login ");
                print(e);
                showSnackbar(e, context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget logoContainer() {
    return Container(
      height: ScreenUtil.instance.setHeight(250),
      child: Center(
        child: Image.asset(
          Styles.APP_LOGO,
          height: ScreenUtil.instance.setWidth(120),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _navigateToSplashPage(context) {
    Navigator.pushReplacementNamed(context, SplashPage.routeNamed);
  }
}
