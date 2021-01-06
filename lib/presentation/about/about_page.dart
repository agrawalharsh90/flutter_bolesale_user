import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/about/details_page.dart';
import 'package:grocery/presentation/about/pdf_page.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';

class AboutPage extends StatelessWidget {
  static const String routeNamed = 'AboutPage';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      context: context,
      appBarTitle: 'About',
      body: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil.instance.setWidth(40),
          ),
          Divider(),
          _personalDetailRow(context, Icons.category, 'Bolesale',
              'Bolesale has a motive to connect each and every Wholesaler, Manufacturer and other Bulky dealers with Retailers & Resellers all over the country. We thrive to connect you with people who find value in your product. We know that replying to every query makes it tough & stressful for you to do your business efficiently & so, we have solved this problem & we take all the headaches from you. You can now focus on only the things that are necessary.\n\n\nWe have designed our products in a way that even the beginners can use our products very easily & efficiently. If you have any problem/issue, we are available whole day & you can contact us anytime.'),
          Divider(),
          _personalDetailRow(context, Icons.privacy_tip, 'Privacy Policy', '',
              pdf: 'assets/pdfs/PrivacyPolicy.pdf'),
          Divider(),
          _personalDetailRow(
              context, Icons.assignment_return, 'Return Policy', '',
              pdf: 'assets/pdfs/ReturnPolicy.pdf'),
          Divider(),
        ],
      ),
    );
  }

  Widget _personalDetailRow(
      BuildContext context, IconData iconData, String title, String detail,
      {String pdf}) {
    return InkWell(
      onTap: () {
        if (pdf != null) {}
        Navigator.pushNamed(
            context, pdf != null ? PdfPage.routeNamed : DetailsPage.routeNamed,
            arguments: ScreenArguments(title: title, details: pdf ?? detail));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.instance.setWidth(20),
          vertical: ScreenUtil.instance.setHeight(20),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(iconData),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20),
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
