import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/styles.dart';

class CustomFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BasketPage.routeNamed);
      },
      child: Container(
        width: ScreenUtil.instance.setWidth(90),
        height: ScreenUtil.instance.setWidth(90),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Styles.FAB_CART_ICON,
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: StoreObserver<CartStore>(
                  builder: (CartStore cartStore, BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
                  decoration: BoxDecoration(
                      color: Styles.WHITE_COLOR,
                      shape: BoxShape.circle,
                      boxShadow: kElevationToShadow[8]),
                  child: Text(
                    cartStore.totalItems.toString(),
                    style: TextStyle(color: Styles.PRIMARY_COLOR),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
