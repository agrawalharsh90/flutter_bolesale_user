import 'package:flutter/material.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/construction_store.dart';
import 'package:grocery/store/sweets_cakes_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/store/vegs_fruits_store.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

import 'custom/custom_button.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: StringValue.MORE_OPTIONS_TITLE,
      showbackArrow: false,
      body: ListView.builder(
          itemCount: StringValue.MORE_OPTIONS_LIST.length,
          itemBuilder: (BuildContext context, index) {
            return CustomButton(
              onTap: () {
                if (StringValue.MORE_OPTIONS_LIST[index]['title'] ==
                    'Log Out') {
                  logout();
                } else {
                  Navigator.pushNamed(
                      context, StringValue.MORE_OPTIONS_LIST[index]['route'],
                      arguments: StringValue.MORE_OPTIONS_LIST[index]
                              .containsKey('url')
                          ? ScreenArguments(
                              url: StringValue.MORE_OPTIONS_LIST[index]['url'],
                              key: StringValue.MORE_OPTIONS_LIST[index]
                                  ['title'])
                          : null);
                }
              },
              elevation: 8,
              imageUrl: StringValue.MORE_OPTIONS_LIST[index]['image'],
              alignment: MainAxisAlignment.spaceBetween,
              verticalMargin: 15,
              horizontalMargin: 20,
              text: StringValue.MORE_OPTIONS_LIST[index]['title'],
              buttonColor: Styles.WHITE_COLOR,
              textColor: Styles.BLACK_COLOR,
            );
          }),
    );
  }

  logout() {
    Provider.of<UserStore>(context).logout();
    Provider.of<CartStore>(context).clearStore();
    Provider.of<ConstructionStore>(context).clearStore();
    Provider.of<SweetsCakesStore>(context).clearStore();
    Provider.of<VegFuitsStore>(context).clearStore();
    Provider.of<AddressStore>(context).clearStore();

    Navigator.pushNamedAndRemoveUntil(
        context, SplashPage.routeNamed, (Route<dynamic> route) => false);
  }
}
