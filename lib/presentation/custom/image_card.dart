import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class ImageCard extends StatelessWidget {
  String imgUrl;
  double width;
  double height;
  Color cardColor;
  Color color;
  BoxFit boxFit;
  String text;
  bool shownForwardArrow;
  Function onTap;
  double fontSize;
  Color textColor;
  TextAlign textAlign;
  double arrowSize;
  double imagePadding;
  double verticalMargin;
  double horizontalMargin;
  MainAxisAlignment mainAxisAlignment;

  ImageCard({
    this.imgUrl,
    this.text,
    this.onTap,
    this.shownForwardArrow = true,
    this.width,
    this.cardColor = Styles.WHITE_COLOR,
    this.color = Styles.WHITE_COLOR,
    this.boxFit = BoxFit.fill,
    this.fontSize = 12,
    this.textAlign = TextAlign.start,
    this.textColor = Styles.PRIMARY_COLOR,
    this.arrowSize = 20,
    this.imagePadding = 10,
    this.height,
    this.verticalMargin = 10,
    this.horizontalMargin = 10,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
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
              height: ScreenUtil.instance.setWidth(height ?? width),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                    BorderRadius.circular(ScreenUtil.instance.setWidth(7)),
                boxShadow: kElevationToShadow[8],
              ),
              child: imgUrl != null ? imageWidget() : SizedBox(),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(5),
            ),
            Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.instance.setWidth(width * 0.8),
                  child: Text(
                    text ?? '',
                    style: TextStyle(fontSize: fontSize, color: textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: textAlign,
                  ),
                ),
                shownForwardArrow
                    ? Icon(
                        Icons.arrow_forward,
                        size: ScreenUtil.instance.setWidth(width * 0.2),
                        color: textColor,
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }

  imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil.instance.setWidth(7)),
      child: imgUrl.contains('http')
          ? CachedNetworkImage(
              imageUrl: imgUrl,
              fit: boxFit,
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
              imgUrl,
              fit: boxFit,
            ),
    );
  }
}
