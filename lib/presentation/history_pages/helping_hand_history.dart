import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/orders_model/vendor_request.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:intl/intl.dart';

class HelpingHandHistoryPage extends StatelessWidget {
  static const String routeNamed = "HelpingHandHistoryPage";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Helping Hands History',
      body: StoreObserver<OrderStore>(
        builder: (OrderStore orderStore, BuildContext context) {
          if (orderStore.isLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            );
          if (orderStore.helpingHands.isEmpty)
            return Center(
              child: getTitleTex("No Order Yet"),
            );
          return ListView.builder(
              itemCount: orderStore.helpingHands.length,
              itemBuilder: (BuildContext context, index) {
                List<VendorRequest> hhList =
                    orderStore.helpingHands.values.toList();
                hhList.sort((a, b) => b.id.compareTo(a.id));
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenUtil.instance.setWidth(20))),
                  margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil.instance.setHeight(7),
                      horizontal: ScreenUtil.instance.setWidth(20)),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          hhList[index].category,
                          style: TextStyle(fontSize: 18),
                        ),
                        CustomButton(
                          verticalMargin: 20,
                          elevation: 5,
                          imageUrl: hhList[index].vendor.imageUrl,
                          text: hhList[index].vendor.name,
                          textColor: Styles.BLACK_COLOR,
                          isImageCircle: true,
                          buttonColor: Styles.WHITE_COLOR,
                          alignment: MainAxisAlignment.spaceAround,
                          isForwardArrow: false,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(DateFormat('dd/MM/yy (hh:mm:ss)').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(hhList[index].id))))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
