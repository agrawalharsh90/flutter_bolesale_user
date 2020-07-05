import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatelessWidget {
  static const String routeNamed = "MyAccount";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'My Account',
      body: StoreObserver<UserStore>(
        builder: (UserStore userStore, BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.instance.setWidth(30),
                vertical: ScreenUtil.instance.setHeight(30)),
            width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: ScreenUtil.instance.setWidth(130),
                  width: ScreenUtil.instance.setWidth(130),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.instance.setWidth(130),
                        height: ScreenUtil.instance.setWidth(130),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Styles.WHITE_COLOR,
                          boxShadow: kElevationToShadow[8],
                        ),
                        child: userStore.loggedInUser.imgUrl == null
                            ? Image.asset(Styles.MO_CONTACT_US)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil.instance.setWidth(100)),
                                child: CachedNetworkImage(
                                  imageUrl: userStore.loggedInUser.imgUrl,
                                  fit: BoxFit.fill,
                                  placeholder: (context, s) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Styles.PRIMARY_COLOR),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, s, o) {
                                    return Center(
                                      child: Icon(Icons.error_outline),
                                    );
                                  },
                                ),
                              ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            if (userStore.isLoading) return;
                            _chooseUploadeImageOption(context, userStore);
                          },
                          child: CircleAvatar(
                            backgroundColor: Styles.PRIMARY_COLOR,
                            child: userStore.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Styles.WHITE_COLOR),
                                    ),
                                  )
                                : Icon(
                                    Icons.add,
                                    color: Styles.WHITE_COLOR,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(40),
                ),
                Container(
                  width:
                      ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        userStore.loggedInUser.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(userStore.loggedInUser.email),
                      Text(userStore.loggedInUser.phoneNumber),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _chooseUploadeImageOption(context, UserStore userStore) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.camera,
                    color: Styles.PRIMARY_COLOR,
                  ),
                  title: Text('Camera'),
                  onTap: () => chooseCamera(userStore, context),
                ),
                ListTile(
                  leading: Icon(
                    Icons.file_upload,
                    color: Styles.PRIMARY_COLOR,
                  ),
                  title: Text('File'),
                  onTap: () => chooseFile(userStore, context),
                ),
              ],
            ),
          );
        });
  }

  Future chooseFile(UserStore userStore, context) async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      try {
        await userStore.updatedUser(
            user: userStore.loggedInUser, imageFile: imageFile);
        showToast("User Profile Pic Updated");
      } catch (e) {
        showErrorSnackBar(e, context);
      }
    }
  }

  Future chooseCamera(UserStore userStore, context) async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      try {
        await userStore.updatedUser(
            user: userStore.loggedInUser, imageFile: imageFile);
        showToast("User Profile Pic Updated");
      } catch (e) {
        showErrorSnackBar(e, context);
      }
    }
  }
}
