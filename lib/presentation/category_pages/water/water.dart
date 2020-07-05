import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/custom_text_field.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

import 'waterVendors.dart';

class WaterPage extends StatefulWidget {
  static const String routeNamed = 'WaterPage';

  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  Vendor selectedVendor;

  String li = '0';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Water',
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(
              fieldHeader: 'Number of Litres per Day',
              textInputType: TextInputType.number,
              borderColor: Styles.WHITE_COLOR,
              titleColor: Styles.BLACK_COLOR,
              initialValue: li,
              onChanged: (value) {
                setState(() {
                  li = value;
                });
              },
            ),
            CustomButton(
              verticalMargin: 50,
              elevation: 5,
              imageUrl: selectedVendor == null
                  ? Styles.MO_CONTACT_US
                  : selectedVendor.imageUrl,
              text: selectedVendor == null
                  ? 'Select Vendors'
                  : selectedVendor.name,
              textColor: Styles.BLACK_COLOR,
              isImageCircle: true,
              buttonColor: Styles.WHITE_COLOR,
              alignment: MainAxisAlignment.spaceAround,
              onTap: () {
                Navigator.pushNamed(context, WaterVendorsPage.routeNamed)
                    .then((value) {
                  if (value != null && value.runtimeType == Vendor) {
                    setState(() {
                      selectedVendor = value;
                    });
                  }
                });
              },
            ),
            StoreObserver<OrderStore>(
              builder: (OrderStore orderStore, BuildContext context) {
                return CustomButton(
                  isLoading: orderStore.isLoading,
                  onTap: () async {
                    if (int.parse(li) < 1 || selectedVendor == null) {
                      showSnackbar(
                          "Please enter valid liters and Select Vendor",
                          context);
                      return;
                    }
                    await orderStore.postWaterRequest({
                      'liters': li,
                      'vendor': Vendor.toJson(selectedVendor)
                    });
                    setState(() {
                      li = '0';
                      selectedVendor = null;
                    });
                    showToast("Your Water Request Recorded");
                    Navigator.pop(context);
                  },
                  verticalMargin: 40,
                  text: 'Submit',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
