import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/custom_text_field.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class PhoneAuthPage extends StatefulWidget {
  static const String routeNamed = 'PhoneAuthPage';

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final GlobalKey<FormState> _detailsFormKey = GlobalKey<FormState>();
  String name;
  String email;
  String referralSellerId;
  bool referEditable = true;

  @override
  Widget build(BuildContext context) {
    return StoreObserver<UserStore>(
      builder: (UserStore userStore, BuildContext context) {
        return CustomScaffold(
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: true,
            context: context,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  logoContainer(),
                  userStore.isLoggedIn
                      ? detailsWidget(userStore)
                      : loginWidget(userStore),
                ],
              ),
            ));
      },
    );
  }

  loginWidget(UserStore userStore) {
    return Container(
      key: Key('LOGIN'),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.instance.setHeight(50),
          ),
          CustomButton(
            isLoading: userStore.isLoading,
            text: "Continue with google",
            onTap: () async {
              try {
                await userStore.loginWithGoogle();
              } catch (e) {
                print("error in login ");
                print(e);
                showSnackbar(e, context);
              }
            },
          )
        ],
      ),
    );
  }

  detailsWidget(UserStore userStore) {
    if (userStore.loggedInUser != null && name == null && email == null) {
      name = userStore.loggedInUser.name;
      email = userStore.loggedInUser.email;
      referralSellerId = userStore.loggedInUser.referralSellerId;
      if (userStore.loggedInUser.createdAt !=
          userStore.loggedInUser.lastLoggedIn) referEditable = false;
    }
    return Column(
      key: Key('DETAILS'),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil.instance.setWidth(30)),
          child: Form(
            key: _detailsFormKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.instance.setHeight(30),
                ),
                CustomTextField(
                  fieldHeader: 'Name',
                  textInputType: TextInputType.text,
                  initialValue: name,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  validators: (value) {
                    if (requiredString(value)) return null;
                    return "Required Field";
                  },
                ),
                CustomTextField(
                  fieldHeader: 'Email',
                  textInputType: TextInputType.emailAddress,
                  initialValue: email,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validators: (value) {
                    if (validateEmail(value)) return null;
                    return "Enter Valid Email";
                  },
                ),
                CustomTextField(
                  fieldHeader: 'Referal Seller Id',
                  textInputType: TextInputType.emailAddress,
                  initialValue: referralSellerId,
                  onChanged: (value) {
                    setState(() {
                      referralSellerId = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(80),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil.instance.setWidth(30)),
          child: CustomButton(
            isLoading: userStore.isLoading,
            text: 'Submit',
            fontSize: 20,
            borderRadius: 5,
            onTap: () async {
              _detailsFormKey.currentState.save();
              if (_detailsFormKey.currentState.validate()) {
                User user = Provider.of<UserStore>(context).loggedInUser;
                user.email = email;
                user.name = name;
                user.referralSellerId = referralSellerId;
                try {
                  await userStore.updatedUser(user: user);
                  _navigateToSplashPage();
                } catch (e) {
                  print("error in update user");
                  print(e);
                  showSnackbar(e, context);
                }
              }
            },
          ),
        ),
      ],
    );
  }

  Widget logoContainer() {
    return Container(
      height: ScreenUtil.instance.setHeight(280),
      child: Center(
        child: Image.asset(
          Styles.APP_LOGO,
          height: ScreenUtil.instance.setWidth(120),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _navigateToSplashPage() {
    Navigator.pushNamedAndRemoveUntil(
        context, SplashPage.routeNamed, (Route<dynamic> route) => false);
  }
}
