import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/stationary_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class StationaryPage extends StatefulWidget {
  static const String routeNamed = 'StationaryPage';

  @override
  _StationaryPageState createState() => _StationaryPageState();
}

class _StationaryPageState extends State<StationaryPage> {
  bool isSearching = false;
  ScrollController _scrollController = ScrollController();
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Stationary',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<StationaryStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<StationaryStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<StationaryStore>(
        builder: (StationaryStore stationaryStore, BuildContext context) {
          if (stationaryStore.productMap == null ||
              stationaryStore.productMap.isEmpty)
            stationaryStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(stationaryStore);
          else
            return dataWidget(stationaryStore);
        },
      ),
    );
  }

  dataWidget(StationaryStore stationaryStore) {
    if (stationaryStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (stationaryStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: stationaryStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          if (stationaryStore.productMap[
                      stationaryStore.productMap.keys.toList()[index]] ==
                  null ||
              stationaryStore
                  .productMap[stationaryStore.productMap.keys.toList()[index]]
                  .isEmpty) return SizedBox();
          return getListWidget(
              stationaryStore.productMap.keys.toList()[index],
              90,
              stationaryStore
                  .productMap[stationaryStore.productMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double width, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selectedCategory = selectedCategory != title ? title : null;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getTitleTex(title, width: 200),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              )
            ],
          ),
        ),
        selectedCategory != title
            ? SizedBox()
            : productList.isEmpty
                ? Center(
                    child: getTitleTex("No Items", fontSize: 14),
                  )
                : Container(
                    child: GridView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
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
                                          "Stationary": {
                                            product.sellerId: product
                                          }
                                        });
                                      }),
                                  imgUrl:
                                      productList[index].productImage != null &&
                                              productList[index]
                                                  .productImage
                                                  .isNotEmpty
                                          ? productList[index].productImage[0]
                                          : Styles.APP_LOGO,
                                  width: width,
                                  height: width,
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
                                  Provider.of<CartStore>(context)
                                      .updateCartMap({
                                    "Stationary": {product.sellerId: product}
                                  });
                                }),
                            imgUrl: productList[index].productImage != null &&
                                    productList[index].productImage.isNotEmpty
                                ? productList[index].productImage[0]
                                : Styles.APP_LOGO,
                            width: width,
                            height: width,
                            imagePadding: 0,
                            verticalMargin: 0,
                            textColor: Styles.BLACK_COLOR,
                            shownForwardArrow: false,
                            text: productList[index].product,
                            boxFit: BoxFit.contain,
                          );
                        }),
                  ),
        Divider(),
      ],
    );
  }

  getConstructionSearchingWidget(StationaryStore stationaryStore) {
    if (stationaryStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (stationaryStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: stationaryStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product:
                    stationaryStore.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      stationaryStore.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Stationary": {product.sellerId: product}
                  });
                }),
            imgUrl: stationaryStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text:
                stationaryStore.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
