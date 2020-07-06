import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/order.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/history_pages/prduct_list_view.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:intl/intl.dart';

class ComboHistoryPage extends StatelessWidget {
  static const String routeNamed = "ComboHistoryPage";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Other History',
      body: StoreObserver<OrderStore>(
        builder: (OrderStore orderStore, BuildContext context) {
          if (orderStore.isLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            );
          if (orderStore.combo.isEmpty)
            return Center(
              child: getTitleTex("No Order Yet"),
            );
          return ListView.builder(
              itemCount: orderStore.combo.length,
              itemBuilder: (BuildContext context, index) {
                List<Order> rnvL = orderStore.combo.values.toList();
                rnvL.sort((a, b) => b.id.compareTo(a.id));
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductListView(
                                  orderModel: rnvL[index],
                                )));
                  },
                  child: Card(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Delivered at:" + rnvL[index].address,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Total Amount: " +
                                rnvL[index].totalAmount.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            rnvL[index].paid ? "Paid Online" : "COD",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(DateFormat('dd/MM/yy (hh:mm:ss)').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(rnvL[index].id))))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
