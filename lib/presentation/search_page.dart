import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      hintText: 'Find An Item',
      searchText: '',
      onSearch: (value) {
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
      body: !isSearching
          ? Center(
              child: getTitleTex('Please Search For Your Requirement',
                  textAlign: TextAlign.center),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTitleTex('Construction Materials'),
                  StoreObserver<ClothesStore>(
                    builder: (ClothesStore constructionStore,
                        BuildContext context) {
                      return getConstructionSearchingWidget(constructionStore);
                    },
                  ),
                ],
              ),
            ),
    );
  }

  getConstructionSearchingWidget(ClothesStore constructionStore) {
    if (constructionStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (constructionStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: constructionStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: constructionStore.filterProductMap.values
                    .toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product = constructionStore
                      .filterProductMap.values
                      .toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Construction Material": {product.sellerId: product}
                  });
                }),
            imgUrl: constructionStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: constructionStore.filterProductMap.values
                .toList()[index]
                .product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
