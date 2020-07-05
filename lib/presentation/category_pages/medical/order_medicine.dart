import "package:flutter/material.dart";
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_fab.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/medical_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class OrderMedicine extends StatefulWidget {
  static const String routeNamed = 'OrderMedicine';

  @override
  _OrderMedicineState createState() => _OrderMedicineState();
}

class _OrderMedicineState extends State<OrderMedicine> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Medicines',
      hintText: 'Find An Item',
      onSearch: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          setState(() {
            isSearching = false;
          });
          Provider.of<MedicalStore>(context).clearSearchingStore();
        } else {
          setState(() {
            isSearching = true;
          });
          Provider.of<MedicalStore>(context).onSearch(searchString: value);
        }
      },
      floatingActionButton: CustomFab(),
      body: StoreObserver<MedicalStore>(
        builder: (MedicalStore medicalStore, BuildContext context) {
          if (isSearching)
            return getMedicineSearchWidget(medicalStore);
          else
            return dataWidget(medicalStore);
        },
      ),
    );
  }

  dataWidget(MedicalStore medicalStore) {
    if (medicalStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (medicalStore.medicinesData.isEmpty)
      return Center(
        child: getTitleTex('Items Added Soon'),
      );
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: medicalStore.medicinesData['drugs'].length,
        itemBuilder: (BuildContext context, index) {
          return ImageCard(
            onTap: () => customProductDialog(
                context: context,
                product: medicalStore.medicinesData['drugs'][index],
                onAdd: (value) {
                  print("on Add" + value.toString());
                  Product product = medicalStore.medicinesData['drugs'][index];
                  product.quantity = value;
                  Provider.of<CartStore>(context).updateCartMap({
                    "Medicines": {product.name: product}
                  });
                }),
            imgUrl: medicalStore.medicinesData['drugs'][index].imageUrl,
            height: 90,
            width: 90,
            imagePadding: 0,
            verticalMargin: 0,
            textColor: Styles.BLACK_COLOR,
            shownForwardArrow: false,
            text: medicalStore.medicinesData['drugs'][index].name,
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
        child: getTitleTex('No items found'),
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
