import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/display_product_list.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/fashion_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class FashionPage extends StatefulWidget {
  static const String routeNamed = 'FashionPage';

  @override
  _FashionPageState createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  bool isSearching = false;
  ScrollController _scrollController = ScrollController();
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Fashion',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<FashionStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<FashionStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<FashionStore>(
        builder: (FashionStore fashionStore, BuildContext context) {
          if (fashionStore.productMap == null ||
              fashionStore.productMap.isEmpty) fashionStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(fashionStore);
          else
            return dataWidget(fashionStore);
        },
      ),
    );
  }

  dataWidget(FashionStore fashionStore) {
    if (fashionStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (fashionStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: fashionStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          if (fashionStore.productMap[
                      fashionStore.productMap.keys.toList()[index]] ==
                  null ||
              fashionStore
                  .productMap[fashionStore.productMap.keys.toList()[index]]
                  .isEmpty) return SizedBox();
          return getListWidget(
              fashionStore.productMap.keys.toList()[index],
              90,
              fashionStore
                  .productMap[fashionStore.productMap.keys.toList()[index]]);
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

  getConstructionSearchingWidget(FashionStore fashionStore) {
    if (fashionStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (fashionStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: fashionStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: fashionStore.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      fashionStore.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Fashion": {product.sellerId: product}
                  });
                }),
            imgUrl: fashionStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: fashionStore.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
