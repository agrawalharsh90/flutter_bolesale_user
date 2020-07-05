import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class SearchBar extends StatelessWidget {
  String hintText;
  IconData icon;
  Function onSearch;
  Function onTap;
  double borderRadius;
  double topPadding;
  double verticalMargin;
  double horizontalMargin;
  String initialValue;

  SearchBar({
    this.hintText,
    this.icon,
    this.onSearch,
    this.onTap,
    this.borderRadius = 5,
    this.topPadding = 0,
    this.verticalMargin = 20,
    this.horizontalMargin = 20,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              ScreenUtil.instance.setWidth(borderRadius))),
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.instance.setHeight(verticalMargin),
          horizontal: ScreenUtil.instance.setWidth(horizontalMargin)),
      child: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(topPadding),
            left: ScreenUtil.instance.setWidth(20)),
        child: TextFormField(
          initialValue: initialValue,
          onChanged: (value) {
            onSearch(value);
          },
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon ?? Icons.search,
              color: Styles.PRIMARY_COLOR,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
