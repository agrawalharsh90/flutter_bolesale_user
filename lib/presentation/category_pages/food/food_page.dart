import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/food_restaurant.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/custom_card.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/category_pages/food/order_starter.dart';
import 'package:grocery/store/food_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  static const String routeNamed = 'FoodPage';

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  ScrollController scrollController = ScrollController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Food',
      hintText: 'Find A Food or Restaurant',
      onSearch: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<FoodStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<FoodStore>(context).onSearch(searchString: value);
        }
      },
      body: StoreObserver<FoodStore>(
        builder: (FoodStore foodStore, BuildContext context) {
          if (isSearching)
            return getSearchingWidget(foodStore);
          else
            return dataWidget(foodStore);
        },
      ),
    );
  }

  dataWidget(FoodStore foodStore) {
    if (foodStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (foodStore.foodRestaurantMap.isEmpty)
      return Center(
        child: getTitleTex('Items Added Soon'),
      );
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: scrollController,
        itemCount: foodStore.foodRestaurantMap.length,
        itemBuilder: (context, index) {
          List key = foodStore.foodRestaurantMap.keys.toList();
          return CustomCard(
            onTap: () => _navigateToOrderStarterPage(
                context, foodStore.foodRestaurantMap[key[index]]),
            horizontalMargin: 20,
            verticalMargin: 10,
            title: key[index],
            desc: foodStore.foodRestaurantMap[key[index]].description ?? ' ',
            rating: foodStore.foodRestaurantMap[key[index]].rating,
            time: 20,
            imgUrl: foodStore.foodRestaurantMap[key[index]].imageUrl,
            ishorizontal: false,
          );
        });
  }

  getSearchingWidget(FoodStore foodStore) {
    if (foodStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (foodStore.filterFoodRestaurantMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: scrollController,
        itemCount: foodStore.filterFoodRestaurantMap.length,
        itemBuilder: (context, index) {
          List key = foodStore.filterFoodRestaurantMap.keys.toList();
          return CustomCard(
            onTap: () => _navigateToOrderStarterPage(
                context, foodStore.filterFoodRestaurantMap[key[index]]),
            horizontalMargin: 20,
            verticalMargin: 10,
            title: key[index],
            desc: foodStore.filterFoodRestaurantMap[key[index]].description ??
                ' ',
            rating: foodStore.filterFoodRestaurantMap[key[index]].rating,
            time: 20,
            imgUrl: foodStore.filterFoodRestaurantMap[key[index]].imageUrl,
            ishorizontal: false,
          );
        });
  }

  _navigateToOrderStarterPage(context, FoodRestaurant foodRestaurant) {
    Navigator.pushNamed(context, OrderStarter.routeNamed,
        arguments: ScreenArguments(foodRestaurant: foodRestaurant));
  }
}
