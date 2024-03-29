import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/display_product_list.dart';
import 'package:grocery/store/categories_store/mobile_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class MobilePage extends StatefulWidget {
  static const String routeNamed = 'MobilePage';

  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  bool isSearching = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Mobiles & Electronics',
      onSearch: (String value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<MobileStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<MobileStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<MobileStore>(
        builder: (MobileStore mobileStore, BuildContext context) {
          if (mobileStore.productMap == null || mobileStore.productMap.isEmpty)
            mobileStore.fetchProductMap();
          if (isSearching)
            return getConstructionSearchingWidget(mobileStore);
          else
            return dataWidget(mobileStore);
        },
      ),
    );
  }

  dataWidget(MobileStore mobileStore) {
    if (mobileStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (mobileStore.productMap.isEmpty)
      return Center(
        child: getTitleTex('Items Will be Added Soon'),
      );
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: mobileStore.productMap.length,
        itemBuilder: (BuildContext context, index) {
          if (mobileStore.productMap[
                      mobileStore.productMap.keys.toList()[index]] ==
                  null ||
              mobileStore
                  .productMap[mobileStore.productMap.keys.toList()[index]]
                  .isEmpty) return SizedBox();
          return getListWidget(
              mobileStore.productMap.keys.toList()[index],
              90,
              mobileStore
                  .productMap[mobileStore.productMap.keys.toList()[index]]);
        });
  }

  getListWidget(String title, double width, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayProductList(
                          title: title,
                          productList: productList,
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getTitleTex(title, width: 200),
              Icon(
                Icons.chevron_right,
                size: 25,
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  getConstructionSearchingWidget(MobileStore mobileStore) {
    if (mobileStore.isSearching)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (mobileStore.filterProductMap.isEmpty)
      return Center(
        child: getTitleTex('No items found', textAlign: TextAlign.center),
      );
    return GridView.builder(
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: mobileStore.filterProductMap.length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => navigateToDisplayProductWidget(
              context: context,
              product: mobileStore.filterProductMap.values.toList()[index],
            ),
            imgUrl: mobileStore.filterProductMap.values
                .toList()[index]
                .productImage[0],
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            text: mobileStore.filterProductMap.values.toList()[index].product,
            boxFit: BoxFit.contain,
          );
        });
  }
}
