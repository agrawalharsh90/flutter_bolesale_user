import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';

class DetailsPage extends StatelessWidget {
  static const String routeNamed = 'DetailsPage';
  String title;
  String detail;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      ScreenArguments arg = ModalRoute
          .of(context)
          .settings
          .arguments;
      title = arg.title;
      detail = arg.details;
    }
    return CustomScaffold(
      context: context,
      appBarTitle: title,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(20),
          ),
          child: Text(
            detail,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
