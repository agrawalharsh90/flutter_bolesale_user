import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CustomScaffold extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
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
    this.appBarTitle,
    this.onBackPress,
    this.floatingActionButton,
    this.backgroundColor = Styles.WHITE_COLOR,
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
                leading: showbackArrow
                    ? IconButton(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(20)),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Styles.WHITE_COLOR,
                          size: ScreenUtil.instance.setHeight(32),
                        ),
                        onPressed:
                            onBackPress ?? () => Navigator.of(context).pop(),
                      )
                    : SizedBox(),
                title: Text(
                  appBarTitle,
                  style: TextStyle(color: Styles.WHITE_COLOR),
                  textAlign: TextAlign.left,
                ),
              )
            : null,
        body: Container(
          color: Styles.WHITE_COLOR,
          height: ScreenUtil.instance.setHeight(ScreenUtil.instance.height),
          width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
          child: body,
        ),
      ),
    );
  }
}
