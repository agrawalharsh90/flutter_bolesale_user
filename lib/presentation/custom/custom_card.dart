import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class CustomCard extends StatelessWidget {
  String title;
  String imgUrl;
  String desc;
  String rating;
  int time;
  bool ishorizontal;
  double verticalMargin;
  double horizontalMargin;
  Function onTap;

  CustomCard({
    this.title,
    this.desc,
    this.rating,
    this.time,
    this.imgUrl,
    this.ishorizontal = true,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(verticalMargin),
            horizontal: ScreenUtil.instance.setWidth(horizontalMargin)),
        elevation: 5,
        child: ishorizontal
            ? Container(
                width: ScreenUtil.instance.setWidth(200),
                child: Column(
                  children: <Widget>[
                    imgUrl.contains('http')
                        ? CachedNetworkImage(
                            imageUrl: imgUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, s) {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Styles.PRIMARY_COLOR),
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
                            fit: BoxFit.cover,
                          ),
                    custom_bottom()
                  ],
                ))
            : Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        height: ScreenUtil.instance.setHeight(100),
                        width: ScreenUtil.instance.setWidth(120),
                        child: imgUrl.contains('http')
                            ? CachedNetworkImage(
                                imageUrl: imgUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, s) {
                                  return Center(child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Styles.PRIMARY_COLOR),
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
                                fit: BoxFit.cover,
                              )),
                    Expanded(
                      child: custom_bottom(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  custom_bottom() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(10),
            horizontal: ScreenUtil.instance.setWidth(10)),
        child: Column(
          children: <Widget>[
            Text(title),
            SizedBox(height: ScreenUtil.instance.setHeight(10)),
            Text(
              desc,
              style: TextStyle(color: Styles.GREY_COLOR, fontSize: 12),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Styles.PRIMARY_COLOR,
                ),
                Text(rating),
                Icon(
                  Icons.access_time,
                  color: Styles.PRIMARY_COLOR,
                ),
                Text(time.toString() + "min"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
