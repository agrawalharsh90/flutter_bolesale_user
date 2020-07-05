import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/presentation/category_pages/helping_hand/helping_hand_type_page.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/custom_search_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/helping_hand_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';

class HelpingHands extends StatelessWidget {
  static const String routeNamed = 'HelpingHands';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarTitle: 'Helping Hands',
//        hintText: 'Search For A Helper',
//        onSearch: (value) {},
        body: StoreObserver<HelpingHandStore>(
          builder: (HelpingHandStore helpingHandStore, BuildContext context) {
            if (helpingHandStore.isLoading)
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                ),
              );
            if (helpingHandStore.helpingHandMap.isEmpty)
              return Center(
                child: getTitleTex('Items Added Soon'),
              );
            List key = helpingHandStore.helpingHandMap.keys.toList();
            return ListView.builder(
                itemCount: key.length,
                itemBuilder: (BuildContext context, index) {
                  return CustomButton(
                    onTap: () => _naviagteToTypePage(context, key[index],
                        helpingHandStore.helpingHandMap[key[index]]),
                    elevation: 8,
                    imageUrl: getIcon(key[index]),
                    alignment: MainAxisAlignment.spaceBetween,
                    verticalMargin: 10,
                    horizontalMargin: 20,
                    text: key[index],
                    buttonColor: Styles.WHITE_COLOR,
                    textColor: Styles.BLACK_COLOR,
                  );
                });
          },
        ));
  }

  getIcon(String title) {
    String image = Styles.HH_CAR_REPAIR_ICONS;
    StringValue.HELPING_HAND_CATEGORY.forEach((element) {
      if (title.toLowerCase() == element['title'].toString().toLowerCase()) {
        image = element['icon'];
      }
    });
    return image;
  }

  _naviagteToTypePage(context, title, List<Vendor> workerList) {
    Navigator.pushNamed(context, HelpingHandTypePage.routeNamed,
        arguments:
            ScreenArguments(helpingHandTitle: title, workerList: workerList));
  }
}
