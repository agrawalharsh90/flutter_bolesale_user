import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';

class PhoneAuthPage extends StatefulWidget {
  static const String routeNamed = 'PhoneAuthPage';

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _detailsFormKey = GlobalKey<FormState>();
  String _phoneNumber;
  String name;
  String email;
  String finalOTP = "";
  int maxOTPletters = 6;

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
                      : userStore.isCodeSent
                          ? otpWidget(userStore)
                          : phoneWidget(userStore),
                ],
              ),
            ));
      },
    );
  }

  phoneWidget(UserStore userStore) {
    return Container(
      key: Key('PHONE'),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
      child: Form(
        key: _phoneFormKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.instance.setHeight(30),
            ),
            CustomTextField(
              fieldHeader: 'Enter Your Mobile Number',
              textInputType: TextInputType.phone,
              initialValue: _phoneNumber,
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
              validators: (value) {
                if (requiredString(value) && value.length == 10) return null;
                return "Enter Valid Number";
              },
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(20),
            ),
            CustomButton(
              isLoading: userStore.isLoading,
              onTap: () async {
                _phoneFormKey.currentState.save();
                if (_phoneFormKey.currentState.validate()) {
                  try {
                    await userStore.sendOTP(
                      phoneNumber: '+91' + _phoneNumber,
                      verificationFailed: (AuthException exception) {
                        showSnackbar(exception.message, context);
                      },
                    );
                  } catch (e) {
                    print("error in send otp");
                    print(e);
                    showSnackbar(e, context);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  otpWidget(UserStore userStore) {
    return Container(
        key: Key('OTP'),
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(30),
            vertical: ScreenUtil.instance.setHeight(40)),
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter OTP',
              style: TextStyle(color: Styles.PRIMARY_COLOR, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(40),
          ),
          userStore.isCodeAutoReceived
              ? SizedBox()
              : PinEntryTextField(
                  isTextObscure: true,
                  fields: maxOTPletters,
                  lastPin: userStore.isCodeAutoReceived ? '000000' : null,
                  onSubmit: (String pin) {
                    setState(() {
                      finalOTP = pin;
                    });
                  },
                ),
          userStore.isCodeAutoReceived
              ? SizedBox()
              : CustomButton(
                  onTap: () {
                    userStore.sendOTP(
                      phoneNumber: '+91' + _phoneNumber,
                      verificationFailed: (AuthException exception) {
                        print("error in resend otp");
                        print(exception);
                      },
                    );
                  },
                  alignment: MainAxisAlignment.end,
                  text: 'Resend OTP?',
                  isForwardArrow: false,
                  textColor: Styles.PRIMARY_COLOR,
                  buttonColor: Styles.TRANSPARENT_COLOR,
                ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(120),
          ),
          CustomButton(
            isLoading: userStore.isLoading,
            onTap: () async {
              if (finalOTP.length == maxOTPletters) {
                print("$finalOTP");
                try {
                  await userStore.verifyOTP(otp: finalOTP);
                } catch (e) {
                  if (e.runtimeType == AuthException) {
                    showSnackbar(e.message, context);
                  } else {
                    showSnackbar(e, context);
                  }
                }
              } else
                showSnackbar("Enter Valid OTP", context);
            },
            text: 'Confirm',
            fontSize: 20,
            borderRadius: 5,
          ),
        ]));
  }

  detailsWidget(UserStore userStore) {
    if (userStore.loggedInUser != null && name == null && email == null) {
      name = userStore.loggedInUser.name;
      email = userStore.loggedInUser.email;
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
