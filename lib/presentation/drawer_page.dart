import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/store/request_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

import 'custom/custom_button.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RequestStore>(context).getRequest();
    Provider.of<OrderStore>(context).getComboOrders();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyAccount.routeNamed);
                },
                child: StoreObserver<UserStore>(
                  builder: (UserStore userStore, BuildContext context) {
                    if (userStore.loggedInUser == null) return SizedBox();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: ScreenUtil.instance.setWidth(60),
                          height: ScreenUtil.instance.setWidth(60),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.WHITE_COLOR,
                            boxShadow: kElevationToShadow[8],
                          ),
                          child: userStore.loggedInUser.imgUrl == null
                              ? Image.asset(
                                  Styles.MO_CONTACT_US,
                                  color: Styles.PRIMARY_COLOR,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil.instance.setWidth(40)),
                                  child: CachedNetworkImage(
                                    imageUrl: userStore.loggedInUser.imgUrl,
                                    fit: BoxFit.fill,
                                    placeholder: (context, s) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Styles.PRIMARY_COLOR),
                                        ),
                                      );
                                    },
                                    errorWidget: (context, s, o) {
                                      return Center(
                                        child: Icon(Icons.error_outline),
                                      );
                                    },
                                  ),
                                ),
                        ),
                        Container(
                          width: ScreenUtil.instance.setWidth(120),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(userStore.loggedInUser.name),
                              Text(userStore.loggedInUser.phoneNumber ?? ''),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: StringValue.MORE_OPTIONS_LIST.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        CustomButton(
                          onTap: () {
                            if (StringValue.MORE_OPTIONS_LIST[index]['title'] ==
                                'Log Out') {
                              logout(context);
                            } else {
                              Navigator.pushNamed(context,
                                  StringValue.MORE_OPTIONS_LIST[index]['route'],
                                  arguments: StringValue
                                          .MORE_OPTIONS_LIST[index]
                                          .containsKey('url')
                                      ? ScreenArguments(
                                          url: StringValue
                                              .MORE_OPTIONS_LIST[index]['url'],
                                          key: StringValue
                                                  .MORE_OPTIONS_LIST[index]
                                              ['title'])
                                      : null);
                            }
                          },
                          imageUrl: StringValue.MORE_OPTIONS_LIST[index]
                              ['image'],
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(),
              getTitleTex('version:\nV1.0.2', textAlign: TextAlign.center),
            ],
          )
        ],
      ),
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
