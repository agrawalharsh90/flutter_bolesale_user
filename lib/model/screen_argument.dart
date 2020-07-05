import 'package:grocery/model/food_restaurant.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/model/vendor.dart';

class ScreenArguments {
  final String helpingHandTitle;
  final User user;
  final FoodRestaurant foodRestaurant;
  final List<Product> productList;
  final List<Vendor> workerList;
  final int currentPage;
  final String url;
  final String key;

  ScreenArguments({
    this.helpingHandTitle,
    this.user,
    this.productList,
    this.foodRestaurant,
    this.workerList,
    this.currentPage = 0,
    this.url,
    this.key,
  });
}
