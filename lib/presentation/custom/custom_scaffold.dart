import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CustomScaffold extends StatelessWidget {
  final String bottomImage;
  final Color backgroundColor;
  final Widget body;
  final double imageWidth;
  final BuildContext context;
  final String appBarTitle;
  final Function onBackPress;
  final bool resizeToAvoidBottomInset;
  final Widget floatingActionButton;
  final bool resizeToAvoidBottomPadding;
  final bool showbackArrow;

  CustomScaffold({
    @required this.body,
    @required this.context,
    this.bottomImage,
    this.appBarTitle,
    this.onBackPress,
    this.floatingActionButton,
    this.backgroundColor = Styles.WHITE_COLOR,
    this.imageWidth = 300,
    this.resizeToAvoidBottomInset = false,
    this.resizeToAvoidBottomPadding = false,
    this.showbackArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onBackPress != null) {
          onBackPress();
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
        floatingActionButton: floatingActionButton,
        backgroundColor: backgroundColor,
        appBar: appBarTitle != null
            ? AppBar(
                backgroundColor: Styles.WHITE_COLOR,
                elevation: 0,
                leading: showbackArrow
                    ? IconButton(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(20)),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Styles.BLACK_COLOR,
                          size: ScreenUtil.instance.setHeight(32),
                        ),
                        onPressed:
                            onBackPress ?? () => Navigator.of(context).pop(),
                      )
                    : SizedBox(),
                title: Text(
                  appBarTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Styles.BLACK_COLOR),
                  textAlign: TextAlign.left,
                ),
              )
            : null,
        body: getBody(),
      ),
    );
  }

  getBody() {
    return (bottomImage == null) ? body : getBodyWithImage();
  }

  getBodyWithImage() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: ScreenUtil.instance.setHeight(ScreenUtil.instance.height),
        child: Column(
          children: <Widget>[
            body,
            Expanded(child: SizedBox()),
            Container(
              child: Image.asset(
                bottomImage,
                width: ScreenUtil.instance.setWidth(imageWidth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
