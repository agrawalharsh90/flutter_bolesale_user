import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/kitchenware_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class KitchenwarePage extends StatefulWidget {
  static const String routeNamed = 'KitchenwarePage';

  @override
  _KitchenwarePageState createState() => _KitchenwarePageState();
}

class _KitchenwarePageState extends State<KitchenwarePage> {
  bool isSearching = false;
  ScrollController _scrollController = ScrollController();
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Kitchenware',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<KitchenwareStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<KitchenwareStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<KitchenwareStore>(
        builder: (KitchenwareStore kitchenwareStore, BuildContext context) {
          if (kitchenwareStore.productMap == null ||
              kitchenwareStore.productMap.isEmpty)
            kitchenwareStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(kitchenwareStore);
          else
            return dataWidget(kitchenwareStore);
        },
      ),
    );
  }

  dataWidget(KitchenwareStore kitchenwareStore) {
    if (kitchenwareStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (kitchenwareStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: kitchenwareStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          if (kitchenwareStore.productMap[
                      kitchenwareStore.productMap.keys.toList()[index]] ==
                  null ||
              kitchenwareStore
                  .productMap[kitchenwareStore.productMap.keys.toList()[index]]
                  .isEmpty) return SizedBox();
          return getListWidget(
              kitchenwareStore.productMap.keys.toList()[index],
              90,
              kitchenwareStore.productMap[
                  kitchenwareStore.productMap.keys.toList()[index]]);
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
                                          "Kitchenware": {
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
                                    "Kitchenware": {product.sellerId: product}
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

  getConstructionSearchingWidget(KitchenwareStore kitchenwareStore) {
    if (kitchenwareStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (kitchenwareStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: kitchenwareStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product:
                    kitchenwareStore.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      kitchenwareStore.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Kitchenware": {product.sellerId: product}
                  });
                }),
            imgUrl: kitchenwareStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: kitchenwareStore.filterProductMap.values
                .toList()[index]
                .product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
