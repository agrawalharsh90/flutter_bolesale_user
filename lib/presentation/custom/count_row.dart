import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CountRow extends StatefulWidget {
  String title;

  String description;
  Function onCountChange;
  Function onDelete;
  String imageUrl;
  String suffixText;
  int initialCount;
  double verticalMargin;
  int moq;

  CountRow(
      {this.imageUrl,
      this.description,
      this.title,
      this.initialCount,
      this.onCountChange,
      this.onDelete,
      this.suffixText,
      this.verticalMargin = 0,
      this.moq});

  @override
  _CountRowState createState() => _CountRowState();
}

class _CountRowState extends State<CountRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.verticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          (widget.imageUrl == null)
              ? SizedBox()
              : Container(
                  width: ScreenUtil.instance.setWidth(80),
                  height: ScreenUtil.instance.setWidth(80),
                  child: widget.imageUrl != null ? imageWidget() : SizedBox(),
                ),
          Container(
            width: ScreenUtil.instance.setWidth(140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title ?? '',
                  style: TextStyle(fontSize: 16, color: Styles.BLACK_COLOR),
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.description ?? '',
                  style: TextStyle(
                      fontSize: 14, color: Styles.BLACK_COLOR.withOpacity(0.5)),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          counterWidget(),
          Text(
            widget.suffixText ?? '',
            style: TextStyle(fontSize: 14, color: Styles.PRIMARY_COLOR),
          )
        ],
      ),
    );
  }

  counterWidget() {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (widget.initialCount <= widget.moq) {
              widget.onDelete();
              return;
            }
            setState(() {
              widget.initialCount--;
              widget.onCountChange(widget.initialCount);
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: ScreenUtil.instance.setWidth(30),
            height: ScreenUtil.instance.setWidth(30),
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Styles.PRIMARY_COLOR,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(ScreenUtil.instance.setWidth(5))),
            ),
            child: Icon(
              Icons.remove,
              color: Styles.WHITE_COLOR,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          constraints:
              BoxConstraints(minWidth: ScreenUtil.instance.setWidth(30)),
          height: ScreenUtil.instance.setWidth(30),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Styles.WHITE_COLOR,
            border: Border.all(color: Styles.PRIMARY_COLOR),
          ),
          child: Text(widget.initialCount.toString()),
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.initialCount++;
              widget.onCountChange(widget.initialCount);
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: ScreenUtil.instance.setWidth(30),
            height: ScreenUtil.instance.setWidth(30),
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Styles.PRIMARY_COLOR,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(ScreenUtil.instance.setWidth(5))),
            ),
            child: Icon(
              Icons.add,
              color: Styles.WHITE_COLOR,
            ),
          ),
        ),
      ],
    );
  }

  imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil.instance.setWidth(7)),
      child: widget.imageUrl.contains('http')
          ? CachedNetworkImage(
              imageUrl: widget.imageUrl,
              placeholder: (context, s) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                  ),
                );
              },
              errorWidget: (context, s, o) {
                return Center(
                  child: Icon(Icons.error_outline),
                );
              },
            )
          : Image.asset(
              widget.imageUrl,
            ),
    );
  }
}
