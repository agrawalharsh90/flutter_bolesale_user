import 'package:flutter/material.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/water_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class WaterVendorsPage extends StatelessWidget {
  static const String routeNamed = 'WaterVendorsPage';

  @override
  Widget build(BuildContext context) {
    return CustomSearchScaffold(
      appBarTitle: 'Vendors',
      hintText: 'Search For A Vendor',
      onSearch: (value) {
        print(value);
      },
      body: StoreObserver<WaterStore>(
        builder: (WaterStore waterStore, BuildContext context) {
          return ListView.builder(
              itemCount: waterStore.waterVendor['vendors'].length,
              itemBuilder: (BuildContext context, int index) {
                return CustomButton(
                  onTap: () {
                    customWorkerDialog(
                        worker: waterStore.waterVendor['vendors'][index],
                        context: context,
                        buttonText: 'Select',
                        onAdd: (value) {
                          Navigator.pop(context,
                              waterStore.waterVendor['vendors'][index]);
                        });
                  },
                  elevation: 8,
                  imageUrl: waterStore.waterVendor['vendors'][index].imageUrl,
                  alignment: MainAxisAlignment.spaceAround,
                  verticalMargin: 10,
                  horizontalMargin: 20,
                  isImageCircle: true,
                  text: waterStore.waterVendor['vendors'][index].name,
                  buttonColor: Styles.WHITE_COLOR,
                  textColor: Styles.BLACK_COLOR,
                );
              });
        },
      ),
    );
  }
}
