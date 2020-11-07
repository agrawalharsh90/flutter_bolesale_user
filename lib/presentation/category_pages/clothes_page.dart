import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/display_product_list.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
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
  ScrollController _scrollController = ScrollController();

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
          if (clothesStore.productMap == null ||
              clothesStore.productMap.isEmpty) clothesStore.fetchProductMap();
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
        shrinkWrap: true,
        itemCount: clothesStore.productMap.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, index) {
          if (clothesStore.productMap[
                      clothesStore.productMap.keys.toList()[index]] ==
                  null ||
              clothesStore
                  .productMap[clothesStore.productMap.keys.toList()[index]]
                  .isEmpty) return SizedBox();
          return getListWidget(
              clothesStore.productMap.keys.toList()[index],
              90,
              clothesStore
                  .productMap[clothesStore.productMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double width, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayProductList(
                          title: title,
                          productList: productList,
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getTitleTex(title, width: 200),
              Icon(
                Icons.chevron_right,
                size: 25,
              )
            ],
          ),
        ),
        Divider(),
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
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: clothesStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: clothesStore.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      clothesStore.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Clothes": {product.sellerId: product}
                  });
                }),
            imgUrl: clothesStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: clothesStore.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
