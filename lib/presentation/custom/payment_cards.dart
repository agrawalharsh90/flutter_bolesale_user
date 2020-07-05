import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class PaymentCard extends StatelessWidget {
  String bank_name;
  int card_no;
  String date;
  String holder_name;
  PaymentCard({
    this.bank_name="",
    this.card_no,
    this.date,
    this.holder_name="",
  });
  @override
  Widget build(BuildContext context) {
    return 
Container( 
       decoration: BoxDecoration(
        color: Styles.PRIMARY_COLOR,
        borderRadius: BorderRadius.all( Radius.circular(10)),
        border: Border.all(width: 3,color: Styles.PRIMARY_COLOR,style: BorderStyle.solid)
      ),
      
      height: 200,
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.instance.setWidth(20)
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: ScreenUtil.instance.setHeight(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(bank_name,
              style: TextStyle(color: Styles.WHITE_COLOR,fontWeight: FontWeight.bold),),
              Icon(Icons.credit_card,color: Styles.WHITE_COLOR,)
            ],),
             SizedBox(height: ScreenUtil.instance.setHeight(20),),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(card_no.toString(),
              style: TextStyle(color: Styles.WHITE_COLOR,fontSize: 18),)
             ),
              SizedBox(height: ScreenUtil.instance.setHeight(20),),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Exp. Date: $date",style: TextStyle(color: Styles.WHITE_COLOR),)
             ),
              SizedBox(height: ScreenUtil.instance.setHeight(20),),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Card Holder: $holder_name",style: TextStyle(color: Styles.WHITE_COLOR,fontSize: 18),)
             ),
              ],
        ),
      ),
    );
  }
}


 
