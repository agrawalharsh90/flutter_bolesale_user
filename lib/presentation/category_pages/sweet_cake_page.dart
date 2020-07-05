import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/sweets_cakes_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class SweetCakePage extends StatefulWidget {
  static const String routeNamed = 'SweetCakePage';

  @override
  _SweetCakePageState createState() => _SweetCakePageState();
}

class _SweetCakePageState extends State<SweetCakePage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Sweets And Cakes',
      hintText: 'Find An Item',
      onSearch: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<SweetsCakesStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<SweetsCakesStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<SweetsCakesStore>(
        builder: (SweetsCakesStore sweetsCakesStore, BuildContext context) {
          if (isSearching)
            return getSweetsCakeSearchingWidget(sweetsCakesStore);
          else
            return dataWidget(sweetsCakesStore);
        },
      ),
    );
  }

  dataWidget(SweetsCakesStore sweetsCakesStore) {
    if (sweetsCakesStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (sweetsCakesStore.sweetCakeMap.isEmpty)
      return Center(
        child: getTitleTex('Items Added Soon'),
      );
    return ListView.builder(
        itemCount: sweetsCakesStore.sweetCakeMap.length,
        itemBuilder: (BuildContext context, index) {
          return getListWidget(
              sweetsCakesStore.sweetCakeMap.keys.toList()[index],
              130,
              90,
              1,
              sweetsCakesStore.sweetCakeMap[
                  sweetsCakesStore.sweetCakeMap.keys.toList()[index]]);
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
                                "Sweets And Cakes": {product.name: product}
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
                          "Sweets And Cakes": {product.name: product}
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

  getSweetsCakeSearchingWidget(SweetsCakesStore sweetsCakesStore) {
    if (sweetsCakesStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (sweetsCakesStore.filterSweetCakeMap.isEmpty)
      return Center(
        child: getTitleTex('No items found'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
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
}
