import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/grocery_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddList extends StatefulWidget {
  static const String routeNamed = 'AddList';

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  File _imageFile;
  User loggedInUser;

  @override
  Widget build(BuildContext context) {
    if (loggedInUser == null) {
      loggedInUser = Provider.of<UserStore>(context).loggedInUser;
    }
    return CustomScaffold(
      appBarTitle: '',
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(30),
            vertical: ScreenUtil.instance.setHeight(20)),
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add List",
                  style: TextStyle(color: Styles.BLACK_COLOR, fontSize: 16),
                )),
            SizedBox(
              height: ScreenUtil.instance.setHeight(80),
            ),
            InkWell(
              onTap: () => _chooseUploadeImageOption(context),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(10))),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20)),
                  height: ScreenUtil.instance.setWidth(200),
                  width: ScreenUtil.instance.setWidth(200),
                  child: _imageFile == null
                      ? Container(
                          height: ScreenUtil.instance.setWidth(70),
                          child: Image.asset(
                            "assets/camera.png",
                            fit: BoxFit.fill,
                          ),
                        )
                      : Image.file(
                          _imageFile,
                        ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            StoreObserver<GroceryStore>(
              builder: (GroceryStore groceryStore, BuildContext context) {
                return CustomButton(
                  verticalMargin: 40,
                  text: "Submit",
                  isLoading: groceryStore.isLoading,
                  onTap: () async {
                    if (_imageFile == null) return;
                    User user = Provider.of<UserStore>(context).loggedInUser;
                    print(user);

                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    try {
                      await groceryStore.addGroceryList(
                          id: id, imageFile: _imageFile);
                      showToast("Your Order List Recorded");
                      Navigator.pop(context);
                    } catch (e) {
                      print("error in uploading");
                      print(e);
                      showErrorSnackBar(e, context);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _chooseUploadeImageOption(context) {
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
                  onTap: chooseCamera,
                ),
                ListTile(
                  leading: Icon(
                    Icons.file_upload,
                    color: Styles.PRIMARY_COLOR,
                  ),
                  title: Text('File'),
                  onTap: chooseFile,
                ),
              ],
            ),
          );
        });
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
      setState(() {
        _imageFile = file;
      });
    });
  }

  Future chooseCamera() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((file) {
      setState(() {
        _imageFile = file;
      });
    });
  }
}
