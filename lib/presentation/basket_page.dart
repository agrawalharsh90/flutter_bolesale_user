import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/count_row.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/order_details.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  static const String routeNamed = 'BasketPage';

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Basket',
      body: StoreObserver<CartStore>(
        builder: (CartStore cartStore, BuildContext context) {
          if (cartStore.isLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            );
          if (cartStore.cartMap.isEmpty)
            return Center(
              child: getTitleTex('No Items Added'),
            );
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartStore.cartMap.length,
                    itemBuilder: (BuildContext context, index) {
                      return getListWidget(
                          cartStore.cartMap.keys.toList()[index],
                          cartStore
                              .cartMap[cartStore.cartMap.keys.toList()[index]]
                              .values
                              .toList());
                    }),
              ),
              CustomButton(
                text: "Checkout to Cart",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomePage.routeNamed, (route) => false,
                      arguments: ScreenArguments(currentPage: 2));
                },
                horizontalMargin: 30,
                verticalMargin: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OrderDetails(
                  items: cartStore.totalItems,
                  total: cartStore.totalAmount,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  getListWidget(String title, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitleTex(title),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            controller: controller,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return CountRow(
                title: productList[index].product,
                imageUrl: productList[index].productImage[0],
                suffixText: "Rs." +
                    (double.parse(productList[index].price) *
                            productList[index].quantity)
                        .toString(),
                initialCount: productList[index].quantity,
                verticalMargin: 10,
                onCountChange: (v) {
                  Product product = productList[index];
                  product.quantity = v;
                  Provider.of<CartStore>(context).updateCartMap({
                    title: {product.sellerId: product}
                  });
                },
                onDelete: () {
                  Provider.of<CartStore>(context)
                      .deleteProductCart(title, productList[index].sellerId);
                },
              );
            }),
      ],
    );
  }
}
