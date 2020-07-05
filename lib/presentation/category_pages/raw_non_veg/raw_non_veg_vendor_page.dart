import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/raw_non_veg_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class RawNonVegVendorPage extends StatelessWidget {
  Map<String, Product> data;

  RawNonVegVendorPage({this.data});

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Vendors',
      hintText: 'Search For A Vendor',
      onSearch: (value) {
        print(value);
      },
      body: StoreObserver<RawNonVegStore>(
        builder: (RawNonVegStore rawNonVegStore, BuildContext context) {
          return ListView.builder(
              itemCount: rawNonVegStore.nonVegVendors.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomButton(
                  onTap: () {
                    customWorkerDialog(
                        worker:
                            rawNonVegStore.nonVegVendors.values.toList()[index],
                        context: context,
                        buttonText: 'Select',
                        onAdd: (value) {
                          Navigator.pop(
                              context,
                              rawNonVegStore.nonVegVendors.values
                                  .toList()[index]);
                        });
                  },
                  elevation: 8,
                  imageUrl: rawNonVegStore.nonVegVendors.values
                      .toList()[index]
                      .imageUrl,
                  alignment: MainAxisAlignment.spaceAround,
                  verticalMargin: 10,
                  horizontalMargin: 20,
                  isImageCircle: true,
                  text:
                      rawNonVegStore.nonVegVendors.values.toList()[index].name,
                  buttonColor: Styles.WHITE_COLOR,
                  textColor: Styles.BLACK_COLOR,
                );
              });
        },
      ),
    );
  }
}
