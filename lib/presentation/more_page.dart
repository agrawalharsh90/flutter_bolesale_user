import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/store/request_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

import 'custom/custom_button.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RequestStore>(context).getRequest();
    Provider.of<OrderStore>(context).getComboOrders();
    return Drawer(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: StringValue.MORE_OPTIONS_LIST.length,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                SizedBox(
                  height: ScreenUtil.instance.setHeight(index == 0 ? 30 : 0),
                ),
                CustomButton(
                  onTap: () {
                    if (StringValue.MORE_OPTIONS_LIST[index]['title'] ==
                        'Log Out') {
                      logout(context);
                    } else {
                      Navigator.pushNamed(context,
                          StringValue.MORE_OPTIONS_LIST[index]['route'],
                          arguments: StringValue.MORE_OPTIONS_LIST[index]
                                  .containsKey('url')
                              ? ScreenArguments(
                                  url: StringValue.MORE_OPTIONS_LIST[index]
                                      ['url'],
                                  key: StringValue.MORE_OPTIONS_LIST[index]
                                      ['title'])
                              : null);
                    }
                  },
                  imageUrl: StringValue.MORE_OPTIONS_LIST[index]['image'],
                  alignment: MainAxisAlignment.spaceBetween,
                  verticalMargin: 0,
                  horizontalMargin: 10,
                  text: StringValue.MORE_OPTIONS_LIST[index]['title'],
                  buttonColor: Styles.TRANSPARENT_COLOR,
                  textColor: Styles.BLACK_COLOR,
                ),
                Divider()
              ],
            );
          }),
    );
  }

  logout(context) {
    Provider.of<UserStore>(context).logout();
    Provider.of<CartStore>(context).clearStore();
    Provider.of<ClothesStore>(context).clearStore();
    Provider.of<AddressStore>(context).clearStore();
    Provider.of<OrderStore>(context).clearStore();
    Provider.of<RequestStore>(context).clearStore();

    Navigator.pushNamedAndRemoveUntil(
        context, SplashPage.routeNamed, (Route<dynamic> route) => false);
  }
}
