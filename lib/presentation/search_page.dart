import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
import 'package:grocery/store/categories_store/essentials_store.dart';
import 'package:grocery/store/categories_store/fashion_store.dart';
import 'package:grocery/store/categories_store/footwear_store.dart';
import 'package:grocery/store/categories_store/kitchenware_store.dart';
import 'package:grocery/store/categories_store/mobile_store.dart';
import 'package:grocery/store/categories_store/sports_store.dart';
import 'package:grocery/store/categories_store/stationary_store.dart';
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
          Provider.of<EssentialsStore>(context).clearSearchingStore();
          Provider.of<FashionStore>(context).clearSearchingStore();
          Provider.of<FootwearStore>(context).clearSearchingStore();
          Provider.of<KitchenwareStore>(context).clearSearchingStore();
          Provider.of<MobileStore>(context).clearSearchingStore();
          Provider.of<SportsStore>(context).clearSearchingStore();
          Provider.of<StationaryStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<ClothesStore>(context).onSearch(searchString: value);
          Provider.of<EssentialsStore>(context).onSearch(searchString: value);
          Provider.of<FashionStore>(context).onSearch(searchString: value);
          Provider.of<FootwearStore>(context).onSearch(searchString: value);
          Provider.of<KitchenwareStore>(context).onSearch(searchString: value);
          Provider.of<MobileStore>(context).onSearch(searchString: value);
          Provider.of<SportsStore>(context).onSearch(searchString: value);
          Provider.of<StationaryStore>(context).onSearch(searchString: value);
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
                  getTitleTex('Clothes'),
                  StoreObserver<ClothesStore>(
                    builder: (ClothesStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Clothes');
                    },
                  ),
                  getTitleTex('Essentails'),
                  StoreObserver<EssentialsStore>(
                    builder: (EssentialsStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Essentails');
                    },
                  ),
                  getTitleTex('Fashion'),
                  StoreObserver<FashionStore>(
                    builder: (FashionStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Fashion');
                    },
                  ),
                  getTitleTex('Footwear'),
                  StoreObserver<FootwearStore>(
                    builder: (FootwearStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Footwear');
                    },
                  ),
                  getTitleTex('Kitchenware'),
                  StoreObserver<KitchenwareStore>(
                    builder: (KitchenwareStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Kitchenware');
                    },
                  ),
                  getTitleTex('Mobile'),
                  StoreObserver<MobileStore>(
                    builder: (MobileStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Mobile');
                    },
                  ),
                  getTitleTex('Sports'),
                  StoreObserver<SportsStore>(
                    builder: (SportsStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Sports');
                    },
                  ),
                  getTitleTex('Stationary'),
                  StoreObserver<SportsStore>(
                    builder: (SportsStore store, BuildContext context) {
                      return getSearchingWidget(store, 'Stationary');
                    },
                  ),
                ],
              ),
            ),
    );
  }

  getSearchingWidget(store, String key) {
    if (store.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (store.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: store.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: store.filterProductMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      store.filterProductMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    key: {product.sellerId: product}
                  });
                }),
            imgUrl:
                store.filterProductMap.values.toList()[index].productImage[0],
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: store.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
