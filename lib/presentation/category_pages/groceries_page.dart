import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/add_list.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/grocery_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class GroceriesPage extends StatefulWidget {
  static const String routeNamed = 'GroceriesPage';

  @override
  _GroceriesPageState createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomSearchScaffold(
            appBarTitle: 'Groceries',
            hintText: 'Find An Item',
            onSearch: (value) {
              print(value);
              if (value == null || value.isEmpty) {
                setState(() {
                  isSearching = false;
                });
                Provider.of<GroceryStore>(context).clearSearchingStore();
              } else {
                setState(() {
                  isSearching = true;
                });
                Provider.of<GroceryStore>(context)
                    .onSearch(searchString: value);
              }
            },
            floatingActionButton: CustomFab(),
            body: StoreObserver<GroceryStore>(
              builder: (GroceryStore groceryStore, BuildContext context) {
                if (isSearching)
                  return getGrocerySearchingWidget(groceryStore);
                else
                  return dataWidget(groceryStore);
              },
            ),
          ),
          Positioned(
            top: ScreenUtil.instance.setHeight(70),
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.instance.setHeight(10),
                horizontal: ScreenUtil.instance.setWidth(10),
              ),
              decoration: BoxDecoration(
                  color: Styles.WHITE_COLOR,
                  boxShadow: kElevationToShadow[8],
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(ScreenUtil.instance.setWidth(50)))),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AddList.routeNamed);
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add, color: Styles.PRIMARY_COLOR),
                    Text(
                      'Add List',
                      style: TextStyle(fontSize: 15, color: Styles.BLACK_COLOR),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dataWidget(GroceryStore groceryStore) {
    if (groceryStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (groceryStore.groceryMap.isEmpty)
      return Center(
        child: getTitleTex('Items Added Soon'),
      );
    return ListView.builder(
        itemCount: groceryStore.groceryMap.length,
        itemBuilder: (BuildContext context, index) {
          return getListWidget(
              groceryStore.groceryMap.keys.toList()[index],
              130,
              90,
              1,
              groceryStore
                  .groceryMap[groceryStore.groceryMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double height, double width, double ratio,
      List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTitleTex(title),
        Container(
          height: ScreenUtil.instance.setWidth(height),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (BuildContext context, index) {
                if (index == 0)
                  return Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.instance.setWidth(20),
                      ),
                      ImageCard(
                        onTap: () => customProductDialog(
                            context: context,
                            product: productList[index],
                            onAdd: (value) {
                              print("on Add" + value.toString());
                              Product product = productList[index];
                              product.quantity = value;
                              Provider.of<CartStore>(context).updateCartMap({
                                "Groceries": {product.name: product}
                              });
                            }),
                        imgUrl: productList[index].imageUrl,
                        width: width,
                        height: width * ratio,
                        imagePadding: 0,
                        verticalMargin: 0,
                        textColor: Styles.BLACK_COLOR,
                        shownForwardArrow: false,
                        text: productList[index].name,
                        boxFit: BoxFit.contain,
                      )
                    ],
                  );
                return ImageCard(
                  onTap: () => customProductDialog(
                      context: context,
                      product: productList[index],
                      onAdd: (value) {
                        print("on Add " + value.toString());
                        Product product = productList[index];
                        product.quantity = value;
                        Provider.of<CartStore>(context).updateCartMap({
                          "Groceries": {product.name: product}
                        });
                      }),
                  imgUrl: productList[index].imageUrl,
                  width: width,
                  height: width * ratio,
                  imagePadding: 0,
                  verticalMargin: 0,
                  textColor: Styles.BLACK_COLOR,
                  shownForwardArrow: false,
                  text: productList[index].name,
                  boxFit: BoxFit.contain,
                );
              }),
        ),
      ],
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
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
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
}
