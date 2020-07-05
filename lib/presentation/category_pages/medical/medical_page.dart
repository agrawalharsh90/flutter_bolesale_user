import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/category_pages/medical/order_medicine.dart';
import 'package:grocery/presentation/category_pages/medical/upload_prescription.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/utils/styles.dart';

class MedicalPage extends StatelessWidget {
  static const String routeNamed = 'MedicalPage';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "Medical",
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.instance.setHeight(80),
            ),
            Center(
              child: Image.asset(
                Styles.MEDICAL,
                height: ScreenUtil.instance.setHeight(300),
              ),
            ),
            SizedBox(
              height: ScreenUtil.instance.setHeight(80),
            ),
            CustomButton(
              onTap: () => _naviagteToUploadPrescriptionPage(context),
              alignment: MainAxisAlignment.spaceBetween,
              elevation: 8,
              imageUrl: Styles.UPLOAD_ICON,
              verticalMargin: 0,
              horizontalMargin: 30,
              text: "Upload  prescription",
              buttonColor: Styles.WHITE_COLOR,
              textColor: Styles.BLACK_COLOR,
            ),
            CustomButton(
              onTap: () => _naviagteToPendingReportPage(context),
              alignment: MainAxisAlignment.spaceAround,
              elevation: 8,
              imageUrl: Styles.PENDING_REPORT_ICON,
              verticalMargin: 30,
              horizontalMargin: 30,
              text: "Order Medicine",
              buttonColor: Styles.WHITE_COLOR,
              textColor: Styles.BLACK_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  _naviagteToUploadPrescriptionPage(context) {
    Navigator.pushNamed(context, UploadPrescription.routeNamed);
  }

  _naviagteToPendingReportPage(context) {
    Navigator.pushNamed(context, OrderMedicine.routeNamed);
  }
}
