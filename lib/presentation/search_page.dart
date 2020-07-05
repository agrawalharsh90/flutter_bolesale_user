import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/construction_store.dart';
import 'package:grocery/store/grocery_store.dart';
import 'package:grocery/store/medical_store.dart';
import 'package:grocery/store/sweets_cakes_store.dart';
import 'package:grocery/store/vegs_fruits_store.dart';
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
          Provider.of<GroceryStore>(context).clearSearchingStore();
          Provider.of<SweetsCakesStore>(context).clearSearchingStore();
          Provider.of<VegFuitsStore>(context).clearSearchingStore();
          Provider.of<ConstructionStore>(context).clearSearchingStore();
          Provider.of<MedicalStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<GroceryStore>(context).onSearch(searchString: value);
          Provider.of<SweetsCakesStore>(context).onSearch(searchString: value);
          Provider.of<VegFuitsStore>(context).onSearch(searchString: value);
          Provider.of<ConstructionStore>(context).onSearch(searchString: value);
          Provider.of<MedicalStore>(context).onSearch(searchString: value);
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
                  getTitleTex('Groceries'),
                  StoreObserver<GroceryStore>(
                    builder: (GroceryStore groceryStore, BuildContext context) {
                      return getGrocerySearchingWidget(groceryStore);
                    },
                  ),
                  getTitleTex('Vegetable And Fruits'),
                  StoreObserver<VegFuitsStore>(
                    builder:
                        (VegFuitsStore vegFruitsStore, BuildContext context) {
                      return getVegFruitsSearchingWidget(vegFruitsStore);
                    },
                  ),
                  getTitleTex('Sweets And Cakes'),
                  StoreObserver<SweetsCakesStore>(
                    builder: (SweetsCakesStore sweetsCakesStore,
                        BuildContext context) {
                      return getSweetsCakeSearchingWidget(sweetsCakesStore);
                    },
                  ),
                  getTitleTex('Construction Materials'),
                  StoreObserver<ConstructionStore>(
                    builder: (ConstructionStore constructionStore,
                        BuildContext context) {
                      return getConstructionSearchingWidget(constructionStore);
                    },
                  ),
                  getTitleTex('Medicines'),
                  StoreObserver<MedicalStore>(
                    builder: (MedicalStore medicalStore, BuildContext context) {
                      return getMedicineSearchWidget(medicalStore);
                    },
                  ),
                ],
              ),
            ),
    );
  }

  getGrocerySearchingWidget(GroceryStore groceryStore) {
    if (groceryStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (groceryStore.filterGroceryMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: groceryStore.filterGroceryMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: groceryStore.filterGroceryMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      groceryStore.filterGroceryMap.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Groceries": {product.name: product}
                  });
                }),
            imgUrl:
                groceryStore.filterGroceryMap.values.toList()[index].imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: groceryStore.filterGroceryMap.values.toList()[index].name,
            boxFit: BoxFit.contain,
          );
        });
  }

  getVegFruitsSearchingWidget(VegFuitsStore vegFuitsStore) {
    if (vegFuitsStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (vegFuitsStore.filterVegFruitsList.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: vegFuitsStore.filterVegFruitsList.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product:
                    vegFuitsStore.filterVegFruitsList.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      vegFuitsStore.filterVegFruitsList.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Raw Non Veg": {product.name: product}
                  });
                }),
            imgUrl: vegFuitsStore.filterVegFruitsList.values
                .toList()[index]
                .imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: vegFuitsStore.filterVegFruitsList.values.toList()[index].name,
            boxFit: BoxFit.contain,
          );
        });
  }

  getSweetsCakeSearchingWidget(SweetsCakesStore sweetsCakesStore) {
    if (sweetsCakesStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (sweetsCakesStore.filterSweetCakeMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: sweetsCakesStore.filterSweetCakeMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product:
                    sweetsCakesStore.filterSweetCakeMap.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product = sweetsCakesStore.filterSweetCakeMap.values
                      .toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Sweets And Cakes": {product.name: product}
                  });
                }),
            imgUrl: sweetsCakesStore.filterSweetCakeMap.values
                .toList()[index]
                .imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text:
                sweetsCakesStore.filterSweetCakeMap.values.toList()[index].name,
            boxFit: BoxFit.contain,
          );
        });
  }

  getConstructionSearchingWidget(ConstructionStore constructionStore) {
    if (constructionStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (constructionStore.filterConstructionMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: constructionStore.filterConstructionMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: constructionStore.filterConstructionMap.values
                    .toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product = constructionStore
                      .filterConstructionMap.values
                      .toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Construction Material": {product.name: product}
                  });
                }),
            imgUrl: constructionStore.filterConstructionMap.values
                .toList()[index]
                .imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: constructionStore.filterConstructionMap.values
                .toList()[index]
                .name,
            boxFit: BoxFit.contain,
          );
        });
  }

  getMedicineSearchWidget(MedicalStore medicalStore) {
    if (medicalStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (medicalStore.filtermedicinesData.isEmpty)
      return Center(
        child: getTitleTex('No items found', fontSize: 12),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: medicalStore.filtermedicinesData.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product:
                    medicalStore.filtermedicinesData.values.toList()[index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product =
                      medicalStore.filtermedicinesData.values.toList()[index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Medicines": {product.name: product}
                  });
                }),
            imgUrl: medicalStore.filtermedicinesData.values
                .toList()[index]
                .imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: medicalStore.filtermedicinesData.values.toList()[index].name,
            boxFit: BoxFit.contain,
          );
        });
  }
}
