import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPayment extends StatelessWidget {
  double sub_total;
  double delivery_total;
  double taxes;

  TotalPayment({
    this.delivery_total,
    this.sub_total,
    this.taxes,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.instance.setWidth(20),
          vertical: ScreenUtil.instance.setHeight(30)
        ),
        child: Column(
          children: <Widget>[
           _customRow("Sub Total",sub_total),
           SizedBox(height: ScreenUtil.instance.setHeight(20),),
           _customRow("Delivery Fee",delivery_total),
           SizedBox(height: ScreenUtil.instance.setHeight(20),),
           _customRow("Taxes",taxes),
           SizedBox(height: ScreenUtil.instance.setHeight(20),),
           _customTotal("Total", sub_total+delivery_total+taxes)
          ],
        ),
      ),
    );
  }
  _customRow(type,price){
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(type),
                Text("\$"+price.toString(),),
              ],
            );
  }
  _customTotal(type,price){
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(type,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text("\$"+price.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ],
            );
  }
}