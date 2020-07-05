import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/utils/styles.dart';

class OrderDetails extends StatelessWidget {
  int items;

//  double saving;
  double total;

  OrderDetails({
    this.items,
//    this.saving,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil.instance.setHeight(30),
              vertical: ScreenUtil.instance.setWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _customColumn("ITEMS", items.toString()),
//         _customLine(),
//           _customColumn("SAVING", "\$"+saving.toString()),
              _customLine(),
              _customColumn("TOTAL", "Rs." + total.toString()),
            ],
          )),
    );
  }

  _customLine() {
    return Container(
      height: ScreenUtil.instance.setHeight(45),
      color: Styles.BLACK_COLOR,
      width: 1,
    );
  }

  _customColumn(title, number) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil.instance.setHeight(30)),
      child: Column(
        children: <Widget>[
          Text(title),
          Text(
            number,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
