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

class UserDetailsEdit extends StatefulWidget {
  static const String routeNamed = 'UserDetailsEdit';

  @override
  _UserDetailsEditState createState() => _UserDetailsEditState();
}

class _UserDetailsEditState extends State<UserDetailsEdit> {
  final GlobalKey<FormState> _detailsFormKey = GlobalKey<FormState>();
  LoggedInUser user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      user = Provider.of<UserStore>(context).loggedInUser;
    }
    return StoreObserver<UserStore>(
      builder: (UserStore userStore, BuildContext context) {
        return CustomScaffold(
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: true,
            context: context,
            body: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil.instance.setHeight(250),
                  child: Center(
                    child: Image.asset(
                      Styles.APP_LOGO,
                      height: ScreenUtil.instance.setWidth(120),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      key: Key('DETAILS'),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.instance.setWidth(30)),
                          child: Form(
                            key: _detailsFormKey,
                            child: Column(
                              children: <Widget>[
                                CustomTextField(
                                  fieldHeader: 'Name',
                                  textInputType: TextInputType.text,
                                  initialValue: user.name,
                                  onChanged: (value) {
                                    setState(() {
                                      user.name = value;
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
                                  initialValue: user.email,
                                  isEditable: false,
                                ),
                                CustomTextField(
                                  fieldHeader: 'Phone Number',
                                  textInputType: TextInputType.phone,
                                  initialValue: user.phoneNumber,
                                  onChanged: (value) {
                                    setState(() {
                                      user.phoneNumber = value;
                                    });
                                  },
                                  validators: (value) {
                                    if (requiredString(value)) return null;
                                    return "Required Field";
                                  },
                                ),
                                CustomTextField(
                                  fieldHeader: 'Referral Seller Id',
                                  textInputType: TextInputType.emailAddress,
                                  isEditable:
                                      (user.createdAt == user.lastLoggedIn),
                                  initialValue: user.referralSellerId,
                                  onChanged: (value) {
                                    setState(() {
                                      user.referralSellerId = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: ScreenUtil.instance.setHeight(50),
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
                                try {
                                  await userStore.updatedUser(user: user);
                                  Navigator.pushReplacementNamed(
                                      context, SplashPage.routeNamed);
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
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
