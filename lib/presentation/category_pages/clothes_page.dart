import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/clothes_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class ClothesPage extends StatefulWidget {
  static const String routeNamed = 'ClothesPage';

  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Clothes',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<ClothesStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<ClothesStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<ClothesStore>(
        builder: (ClothesStore clothesStore, BuildContext context) {
          if(clothesStore.productMap==null||clothesStore.productMap.isEmpty)
            clothesStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(clothesStore);
          else
            return dataWidget(clothesStore);
        },
      ),
    );
  }

  dataWidget(ClothesStore clothesStore) {
    if (clothesStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (clothesStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        itemCount: clothesStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          return getListWidget(
              clothesStore.productMap.keys.toList()[index],
              130,
              90,
              1,
              clothesStore.productMap[
                  clothesStore.productMap.keys.toList()[index]]);
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
                              Provider.of<CartStore>(context).updateCartMap({
                                "Construction Material": {product.name: product}
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
                          "Construction Material": {product.name: product}
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

  getConstructionSearchingWidget(ClothesStore clothesStore) {
    if (clothesStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (clothesStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: clothesStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: clothesStore.filterProductMap.values
                    .toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product = clothesStore
                      .filterProductMap.values
                      .toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Clothes": {product.name: product}
                  });
                }),
            imgUrl: clothesStore.filterProductMap.values
                .toList()[index]
                .imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: clothesStore.filterProductMap.values
                .toList()[index]
                .name,
            boxFit: BoxFit.contain,
          );
        });
  }
}
