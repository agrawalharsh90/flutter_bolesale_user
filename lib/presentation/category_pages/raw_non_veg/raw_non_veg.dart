import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/category_pages/raw_non_veg/raw_non_veg_basket.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/raw_non_veg_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class RawNonVeg extends StatefulWidget {
  static const String routeNamed = 'RawNonVeg';

  @override
  _RawNonVegState createState() => _RawNonVegState();
}

class _RawNonVegState extends State<RawNonVeg> {
  bool isSearching = false;
  Map<String, Product> rawNonVegOrder = Map<String, Product>();

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Raw Meat',
      hintText: 'Find An Item',
      onBack: rawNonVegOrder.isEmpty
          ? null
          : () {
              showWarnigDialog(context);
            },
      onSearch: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<RawNonVegStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<RawNonVegStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: fab(),
      body: StoreObserver<RawNonVegStore>(
        builder: (RawNonVegStore rawNonVegStore, BuildContext context) {
          if (isSearching)
            return getSearchingWidget(rawNonVegStore);
          else
            return dataWidget(rawNonVegStore);
        },
      ),
    );
  }

  dataWidget(RawNonVegStore rawNonVegStore) {
    if (rawNonVegStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (rawNonVegStore.nonVegMap.isEmpty)
      return Center(
        child: getTitleTex('Items Added Soon'),
      );
    return ListView.builder(
        itemCount: rawNonVegStore.nonVegMap.length,
        itemBuilder: (BuildContext context, index) {
          return getListWidget(
              rawNonVegStore.nonVegMap.keys.toList()[index],
              130,
              90,
              1,
              rawNonVegStore
                  .nonVegMap[rawNonVegStore.nonVegMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double height, double width, double ratio,
      List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitleTex(title),
        Container(
          height: ScreenUtil.instance.setWidth(height),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (BuildContext context, index) {
                if (index == 0)
                  return Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.instance.setWidth(20),
                      ),
                      ImageCard(
                        onTap: () => customProductDialog(
                            context: context,
                            product: productList[index],
                            onAdd: (value) {
                              print("on Add" + value.toString());
                              Product product = productList[index];
                              product.quantity = value;
//                              Provider.of<CartStore>(context).updateCartMap({
//                                "Raw Non Veg": {product.name: product}
//                              });
                              setState(() {
                                rawNonVegOrder.addAll({product.name: product});
                              });
                            }),
                        imgUrl: productList[index].imageUrl,
                        width: width,
                        height: width * ratio,
                        imagePadding: 0,
                        verticalMargin: 0,
                        textColor: Styles.BLACK_COLOR,
                        shownForwardArrow: false,
                        text: productList[index].name,
                        boxFit: BoxFit.contain,
                      )
                    ],
                  );
                return ImageCard(
                  onTap: () => customProductDialog(
                      context: context,
                      product: productList[index],
                      onAdd: (value) {
                        print("on Add " + value.toString());
                        Product product = productList[index];
                        product.quantity = value;
                        Provider.of<CartStore>(context).updateCartMap({
                          "Raw Non Veg": {product.name: product}
                        });
                      }),
                  imgUrl: productList[index].imageUrl,
                  width: width,
                  height: width * ratio,
                  imagePadding: 0,
                  verticalMargin: 0,
                  textColor: Styles.BLACK_COLOR,
                  shownForwardArrow: false,
                  text: productList[index].name,
                  boxFit: BoxFit.contain,
                );
              }),
        ),
      ],
    );
  }

  getSearchingWidget(RawNonVegStore rawNonVegStore) {
    if (rawNonVegStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (rawNonVegStore.filterNonVegMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: rawNonVegStore.filterNonVegMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: rawNonVegStore.filterNonVegMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      rawNonVegStore.filterNonVegMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Raw Non Veg": {product.name: product}
                  });
                }),
            imgUrl:
                rawNonVegStore.filterNonVegMap.values.toList()[index].imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: rawNonVegStore.filterNonVegMap.values.toList()[index].name,
            boxFit: BoxFit.contain,
          );
        });
  }

  fab() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RawNonVegBasketPage(
                      data: rawNonVegOrder,
                    )));
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
              child: Container(
                padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
                decoration: BoxDecoration(
                    color: Styles.WHITE_COLOR,
                    shape: BoxShape.circle,
                    boxShadow: kElevationToShadow[8]),
                child: Text(
                  rawNonVegOrder.length.toString(),
                  style: TextStyle(color: Styles.PRIMARY_COLOR),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showWarnigDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "If you go back then your cart will be cleared",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Styles.WHITE_COLOR),
                        ),
                        color: Styles.PRIMARY_COLOR,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomePage.routeNamed, (route) => false,
                              arguments: ScreenArguments(currentPage: 0));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
