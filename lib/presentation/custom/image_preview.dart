import 'package:flutter/material.dart';
import 'package:grocery/utils/globals.dart';

class ImagePreview extends StatelessWidget {
  String imgUrl;

  ImagePreview({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: imageWidget(imgUrl: imgUrl),
      ),
    );
  }
}
