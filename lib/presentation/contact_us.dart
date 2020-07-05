import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class ContactUs extends StatelessWidget {
  static const String routeNamed = 'ContactUs';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Contact Us',
      body: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.instance.setWidth(40),
          ),
          getTitleTex(
              'SAHAYATA HOME SERVICES\n\nPurvi khurmabaad, Siwan, Bihar,841226',
              textAlign: TextAlign.center,
              textColor: Styles.BLACK_COLOR),
          SizedBox(
            height: ScreenUtil.instance.setWidth(40),
          ),
          _personalDetailRow(Icons.mail, 'happiness@sahayatahome.com', context),
          _personalDetailRow(Icons.call, '+918092848980', context),
          _personalDetailRow(Icons.call, '+918056918389', context),
        ],
      ),
    );
  }

  Widget _personalDetailRow(IconData iconData, String detail, context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(20),
        vertical: ScreenUtil.instance.setHeight(10),
      ),
      child: InkWell(
        onTap: () {
          urlLauncher(detail, context);
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(iconData),
                  Text(
                    detail,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: ScreenUtil.instance.setHeight(25),
            )
          ],
        ),
      ),
    );
  }
}
