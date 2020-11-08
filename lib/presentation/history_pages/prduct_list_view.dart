import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/order.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class ProductListView extends StatelessWidget {
  Order orderModel;

  ProductListView({this.orderModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Order :' + orderModel.id,
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.instance.setHeight(20),
          horizontal: ScreenUtil.instance.setWidth(20),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderModel.ordersMap.length,
                  itemBuilder: (BuildContext context, index) {
                    List<Product> productList =
                        orderModel.ordersMap.values.toList();
                    return countRow(
                      title: productList[index].product,
                      imageUrl: productList[index].productImage[0],
                      suffixText: "Rs." +
                          (double.parse(productList[index].price) *
                                  productList[index].quantity)
                              .toString(),
                      initialCount: productList[index].quantity,
                      verticalMargin: 10,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget countRow(
      {String title,
      String description,
      String imageUrl,
      String suffixText,
      int initialCount,
      double verticalMargin}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          (imageUrl == null)
              ? SizedBox()
              : Container(
                  width: ScreenUtil.instance.setWidth(80),
                  height: ScreenUtil.instance.setWidth(80),
                  child: imageUrl != null
                      ? imageWidget(imgUrl: imageUrl)
                      : SizedBox(),
                ),
          Container(
            width: ScreenUtil.instance.setWidth(140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? '',
                  style: TextStyle(fontSize: 16, color: Styles.BLACK_COLOR),
                  textAlign: TextAlign.start,
                ),
                Text(
                  description ?? '',
                  style: TextStyle(
                      fontSize: 14, color: Styles.BLACK_COLOR.withOpacity(0.5)),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.instance.setWidth(30),
            height: ScreenUtil.instance.setWidth(30),
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Styles.WHITE_COLOR,
              border: Border.all(color: Styles.PRIMARY_COLOR),
            ),
            child: Text(initialCount.toString()),
          ),
          Text(
            suffixText ?? '',
            style: TextStyle(fontSize: 14, color: Styles.PRIMARY_COLOR),
          )
        ],
      ),
    );
  }
}
