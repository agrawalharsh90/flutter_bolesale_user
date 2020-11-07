import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class ImageCard extends StatelessWidget {
  String imgUrl;
  double width;
  Color cardColor;
  Color color;
  BoxFit boxFit;
  String text;
  Function onTap;
  double fontSize;
  Color textColor;
  TextAlign textAlign;
  double arrowSize;
  double imagePadding;
  double verticalMargin;
  double horizontalMargin;
  int maxLines;

  ImageCard({
    this.imgUrl,
    this.text,
    this.onTap,
    this.width,
    this.cardColor = Styles.WHITE_COLOR,
    this.color = Styles.WHITE_COLOR,
    this.boxFit = BoxFit.fill,
    this.fontSize = 12,
    this.textAlign = TextAlign.start,
    this.textColor = Styles.PRIMARY_COLOR,
    this.imagePadding = 10,
    this.verticalMargin = 10,
    this.horizontalMargin = 10,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ScreenUtil.instance.setWidth(width),
        color: color,
        margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.instance.setHeight(verticalMargin),
          horizontal: ScreenUtil.instance.setWidth(horizontalMargin),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(imagePadding),
              width: ScreenUtil.instance.setWidth(width),
              height: ScreenUtil.instance.setWidth(width),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                    BorderRadius.circular(ScreenUtil.instance.setWidth(7)),
                boxShadow: kElevationToShadow[8],
              ),
              child: imgUrl != null
                  ? imageWidget(
                      imgUrl: imgUrl,
                      boxFit: boxFit,
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(5),
            ),
            Container(
              alignment: Alignment.center,
              width: ScreenUtil.instance.setWidth(width),
              child: Text(
                text ?? '',
                style: TextStyle(fontSize: fontSize, color: textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                textAlign: textAlign,
              ),
            )
          ],
        ),
      ),
    );
  }
}
