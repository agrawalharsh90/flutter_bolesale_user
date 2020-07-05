import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScaffold extends StatelessWidget {
  static const String routeNamed = 'WebviewScaffold';
  String url;
  Key key;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      ScreenArguments arg = ModalRoute.of(context).settings.arguments;
      url = arg.url;
      key = Key(arg.key);
    }
    return Scaffold(
      body: Container(
        width: ScreenUtil.instance.setWidth(ScreenUtil.instance.width),
        child: WebView(
          key: key,
          initialUrl: url,
        ),
      ),
    );
  }
}
