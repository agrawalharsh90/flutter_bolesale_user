import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:pdf_render/pdf_render_widgets2.dart';

class PdfPage extends StatelessWidget {
  static const String routeNamed = 'PdfPage';
  String title;
  String detail;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      ScreenArguments arg = ModalRoute.of(context).settings.arguments;
      title = arg.title;
      detail = arg.details;
    }
    return CustomScaffold(
      context: context,
      appBarTitle: title,
      body: PdfViewer(assetName: detail),
    );
  }
}
