import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/food_restaurant.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/custom/count_row.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class OrderStarter extends StatelessWidget {
  static const String routeNamed = 'OrderStarter';

  FoodRestaurant foodRestaurant;

  @override
  Widget build(BuildContext context) {
    if (foodRestaurant == null) {
      ScreenArguments arg = ModalRoute.of(context).settings.arguments;
      foodRestaurant = arg.foodRestaurant;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.instance.setWidth(
                    ScreenUtil.instance.setWidth(ScreenUtil.instance.width)),
                height: ScreenUtil.instance.setHeight(250),
                child: foodRestaurant.imageUrl.contains('http')
                    ? CachedNetworkImage(
                        imageUrl: foodRestaurant.imageUrl,
                        fit: BoxFit.fill,
                        placeholder: (context, s) {
                          return Center(child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                ),);
                        },
                        errorWidget: (context, s, o) {
                          return Center(
                            child: Icon(Icons.error_outline),
                          );
                        },
                      )
                    : Image.asset(
                        foodRestaurant.imageUrl,
                        fit: BoxFit.fill,
                      ),
              ),
              _customList(),
              _customBottom(context),
            ],
          ),
          _customContainer(context),
        ],
      ),
    );
  }

  _customContainer(context) {
    return Positioned(
      right: 0,
      left: 0,
      top: ScreenUtil.instance.setHeight(200),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(30),
            vertical: ScreenUtil.instance.setHeight(10)),
        margin:
            EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
        decoration: BoxDecoration(
          color: Styles.WHITE_COLOR,
          boxShadow: kElevationToShadow[5],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: ScreenUtil.instance.setWidth(180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(foodRestaurant.name),
                  Text(
                    foodRestaurant.description ?? '',
                    style: TextStyle(fontSize: 12, color: Styles.GREY_COLOR),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(10),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Styles.PRIMARY_COLOR,
                      ),
                      Text(foodRestaurant.rating),
                      Icon(
                        Icons.access_time,
                        color: Styles.PRIMARY_COLOR,
                      ),
                      Text("30 min"),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (foodRestaurant.phone.isNotEmpty)
                  urlLauncher(foodRestaurant.phone, context);
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    Styles.PHONE_ICON,
                    height: ScreenUtil.instance.setWidth(50),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(10),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(25),
                    child: IgnorePointer(
                      child: OutlineButton(
                          child: Text("Open"),
                          borderSide: BorderSide(color: Styles.PRIMARY_COLOR),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _customList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: foodRestaurant.items.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(40),
                  ),
                  CountRow(
                    title: foodRestaurant.items[index].name,
                    suffixText: 'Rs.' + foodRestaurant.items[index].price,
                    description: foodRestaurant.items[index].description ?? ' ',
                    initialCount: 0,
                    verticalMargin: 10,
                    onCountChange: (v) {
                      print(v);
                      Product product = foodRestaurant.items[index];
                      product.quantity = v;
                      Provider.of<CartStore>(context).updateCartMap({
                        'Food': {product.name: product}
                      });
                    },
                  )
                ],
              );
            }
            return CountRow(
              title: foodRestaurant.items[index].name,
              suffixText: 'Rs.' + foodRestaurant.items[index].price,
              description: foodRestaurant.items[index].description ?? ' ',
              initialCount: 0,
              verticalMargin: 10,
              onCountChange: (v) {
                print(v);
                Product product = foodRestaurant.items[index];
                product.quantity = v;
                Provider.of<CartStore>(context).updateCartMap({
                  'Food': {product.name: product}
                });
              },
            );
          }),
    );
  }

  _customBottom(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () =>
            Navigator.pushReplacementNamed(context, BasketPage.routeNamed),
        child: Material(
          elevation: 20,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil.instance.setHeight(15),
                    bottom: ScreenUtil.instance.setHeight(15),
                    left: ScreenUtil.instance.setWidth(50)),
                child: Text(
                  "Show Order",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_forward),
//            Padding(
//              padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(130)),
//              child: Text("\$91.60"),
//            )
            ],
          ),
        ),
      ),
    );
  }
}
