import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/sports_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class SportsPage extends StatefulWidget {
  static const String routeNamed = 'SportsPage';

  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Sports',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<SportsStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<SportsStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<SportsStore>(
        builder: (SportsStore sportsStore, BuildContext context) {
          if (sportsStore.productMap == null || sportsStore.productMap.isEmpty)
            sportsStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(sportsStore);
          else
            return dataWidget(sportsStore);
        },
      ),
    );
  }

  dataWidget(SportsStore sportsStore) {
    if (sportsStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (sportsStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        itemCount: sportsStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          return getListWidget(
              sportsStore.productMap.keys.toList()[index],
              130,
              90,
              1,
              sportsStore
                  .productMap[sportsStore.productMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double height, double width, double ratio,
      List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitleTex(title),
        productList.isEmpty
            ? Center(
                child: getTitleTex("No Items", fontSize: 14),
              )
            : Container(
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
                                    Provider.of<CartStore>(context)
                                        .updateCartMap({
                                      "Sports": {product.sellerId: product}
                                    });
                                  }),
                              imgUrl: productList[index].productImage[0],
                              width: width,
                              height: width * ratio,
                              imagePadding: 0,
                              verticalMargin: 0,
                              textColor: Styles.BLACK_COLOR,
                              shownForwardArrow: false,
                              text: productList[index].product,
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
                                "Sports": {product.sellerId: product}
                              });
                            }),
                        imgUrl: productList[index].productImage[0],
                        width: width,
                        height: width * ratio,
                        imagePadding: 0,
                        verticalMargin: 0,
                        textColor: Styles.BLACK_COLOR,
                        shownForwardArrow: false,
                        text: productList[index].product,
                        boxFit: BoxFit.contain,
                      );
                    }),
              ),
      ],
    );
  }

  getConstructionSearchingWidget(SportsStore sportsStore) {
    if (sportsStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (sportsStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: sportsStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: sportsStore.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      sportsStore.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Sports": {product.sellerId: product}
                  });
                }),
            imgUrl: sportsStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: sportsStore.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
