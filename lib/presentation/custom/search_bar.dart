import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class SearchBar extends StatefulWidget {
  String hintText;
  IconData icon;
  Function onSearch;
  double borderRadius;
  double topPadding;
  double verticalMargin;
  double horizontalMargin;
  String initialValue;

  SearchBar({
    this.hintText,
    this.icon,
    this.onSearch,
    this.borderRadius = 5,
    this.topPadding = 0,
    this.verticalMargin = 20,
    this.horizontalMargin = 20,
    this.initialValue,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              ScreenUtil.instance.setWidth(widget.borderRadius))),
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.instance.setHeight(widget.verticalMargin),
          horizontal: ScreenUtil.instance.setWidth(widget.horizontalMargin)),
      child: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(widget.topPadding),
            left: ScreenUtil.instance.setWidth(20)),
        child: TextFormField(
          initialValue: widget.initialValue,
          onSaved: (value) {
            setState(() {
              text = value;
            });
            if (value.isNotEmpty) widget.onSearch(value);
          },
          onFieldSubmitted: (value) {
            setState(() {
              text = value;
            });
            if (value.isNotEmpty) widget.onSearch(value);
          },
          onEditingComplete: () {
            if (text.isNotEmpty) widget.onSearch(text);
          },
          onChanged: (value) {
            setState(() {
              text = value;
            });
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                widget.icon ?? Icons.search,
                color: Styles.PRIMARY_COLOR,
              ),
              onPressed: () {
                if (text.isNotEmpty) widget.onSearch(text);
              },
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
