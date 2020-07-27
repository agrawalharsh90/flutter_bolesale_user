import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/utils/styles.dart';

class ImagePreview extends StatelessWidget {
  String imgUrl;

  ImagePreview({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: imageWidget(),
      ),
    );
  }

  imageWidget() {
    return imgUrl.contains('http')
        ? CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.fill,
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
            fit: BoxFit.fill,
          );
  }
}
