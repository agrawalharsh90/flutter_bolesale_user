import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isForwardArrow;
  final Function onTap;
  final double width;
  final Color textColor;
  final Color buttonColor;
  final bool isLoading;
  final double borderRadius;
  final double fontSize;
  final double verticalMargin;
  final double horizontalMargin;
  final MainAxisAlignment alignment;
  final bool isImageCircle;
  final double elevation;

  CustomButton({
    this.text,
    this.imageUrl,
    this.onTap,
    this.width,
    this.isLoading = false,
    this.textColor = Styles.WHITE_COLOR,
    this.buttonColor = Styles.PRIMARY_COLOR,
    this.isForwardArrow = true,
    this.alignment = MainAxisAlignment.center,
    this.fontSize = 15,
    this.verticalMargin = 10,
    this.horizontalMargin = 0,
    this.isImageCircle = false,
    this.borderRadius = 0,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: buttonColor,
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.instance.setHeight(verticalMargin),
          horizontal: ScreenUtil.instance.setWidth(horizontalMargin)),
      child: InkWell(
        onTap: () {
          if (isLoading) return;
          if (onTap == null) return;
          onTap();
        },
        child: Container(
          constraints:
              BoxConstraints(minHeight: ScreenUtil.instance.setHeight(50)),
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(10),
            horizontal: ScreenUtil.instance.setWidth(20),
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          width:
              ScreenUtil.instance.setWidth(width ?? ScreenUtil.instance.width),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Styles.WHITE_COLOR),
                  ),
                )
              : Row(
                  mainAxisAlignment: alignment,
                  children: <Widget>[
                    imageUrl == null
                        ? SizedBox()
                        : Container(
                            height: ScreenUtil.instance.setHeight(38),
                            width: ScreenUtil.instance.setHeight(38),
                            decoration: BoxDecoration(
                              shape: isImageCircle
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                            ),
                            child: isImageCircle
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil.instance.setHeight(38),
                                    ),
                                    child: imageWidget(),
                                  )
                                : imageWidget(),
                          ),
                    SizedBox(
                      width: imageUrl == null
                          ? 0
                          : ScreenUtil.instance.setWidth(10),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.instance.setWidth(0)),
                          child: Text(
                            text ?? '',
                            style:
                                TextStyle(color: textColor, fontSize: fontSize),
                          ),
                        ),
                        SizedBox(
                          width: text == null
                              ? 0
                              : ScreenUtil.instance.setWidth(5),
                        ),
                        isForwardArrow
                            ? Image.asset(
                                Styles.FORWARD_ARROW,
                                height: ScreenUtil.instance.setHeight(20),
                                color: textColor,
                              )
                            : SizedBox(),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }

  imageWidget() {
    return imageUrl.contains('http')
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: isImageCircle ? BoxFit.fill : BoxFit.contain,
            color: Styles.PRIMARY_COLOR,
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
            imageUrl,
            color: Styles.PRIMARY_COLOR,
            fit: isImageCircle ? BoxFit.fill : BoxFit.contain,
          );
  }
}
