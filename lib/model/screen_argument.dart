import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';

class ScreenArguments {
  final String helpingHandTitle;
  final User user;
  final List<Product> productList;
  final int currentPage;
  final String url;
  final String key;

  ScreenArguments({
    this.helpingHandTitle,
    this.user,
    this.productList,
    this.currentPage = 0,
    this.url,
    this.key,
  });
}
