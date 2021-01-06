import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';

class ScreenArguments {
  final String helpingHandTitle;
  final LoggedInUser user;
  final List<Product> productList;
  final int currentPage;
  final String url;
  final String key;
  final String title;
  final String details;

  ScreenArguments({
    this.helpingHandTitle,
    this.user,
    this.productList,
    this.currentPage = 0,
    this.url,
    this.key,
    this.title,
    this.details,
  });
}
