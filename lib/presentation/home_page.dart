import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/cart_page.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/presentation/more_page.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/search_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/offer_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  User loggedInUser;
  int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == null) {
      ScreenArguments arg = ModalRoute.of(context).settings.arguments;
      currentPage = arg.currentPage;
    }
    return WillPopScope(
      onWillPop: () async {
        if (currentPage != 0) {
          setState(() {
            currentPage = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Styles.WHITE_COLOR,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (page) {
            setState(() {
              currentPage = page;
            });
          },
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(
                icon: getBottomNavigationWidget(
                  Styles.BNI_HOME_ICON,
                  Styles.BNI_HOME_SELECTED_ICON,
                  'Home',
                  currentPage == 0,
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: getBottomNavigationWidget(
                  Styles.BNI_SEARCH_ICON,
                  Styles.BNI_SEARCH_SELECTED_ICON,
                  'Search',
                  currentPage == 1,
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: getBottomNavigationWidget(
                  Styles.BNI_CART_ICON,
                  Styles.BNI_CART_SELECTED_ICON,
                  'Cart',
                  currentPage == 2,
                ),
                title: SizedBox()),
            BottomNavigationBarItem(
                icon: getBottomNavigationWidget(
                  Styles.BNI_MORE_ICON,
                  Styles.BNI_MORE_SELECTED_ICON,
                  'More',
                  currentPage == 3,
                ),
                title: SizedBox()),
          ],
        ),
        body: currentPage == 0
            ? homeWidget()
            : currentPage == 1
                ? SearchPage()
                : currentPage == 2 ? CartPage() : MorePage(),
      ),
    );
  }

  homeWidget() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          profileRow(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AddressEditPage.routeNamed);
            },
            child: IgnorePointer(
              child: StoreObserver<AddressStore>(
                builder: (AddressStore addressStore, BuildContext context) {
                  return SearchBar(
                    hintText: addressStore.address == null
                        ? "Select Delivery Location"
                        : addressStore.address.addressString,
                    icon: Icons.location_on,
                    onSearch: (value) {
                      print(value);
                    },
                  );
                },
              ),
            ),
          ),
          getTitleTex("Offers"),
          StoreObserver<OfferStore>(
            builder: (OfferStore offerStore, BuildContext context) {
              if (offerStore.isLoading) return CircularProgressIndicator();
              if (offerStore.offerMap.isEmpty)
                return Center(
                  child: getTitleTex("Offers Will Be added soon"),
                );
              return Container(
                height: ScreenUtil.instance.setWidth(190),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: offerStore.offerMap.length,
                    itemBuilder: (BuildContext context, index) {
                      if (index == 0)
                        return Row(
                          children: <Widget>[
                            SizedBox(
                              width: ScreenUtil.instance.setWidth(20),
                            ),
                            ImageCard(
                              imgUrl: offerStore.offerMap.values
                                      .toList()[index]
                                      .offerUrl ??
                                  'assets/offericon0.jpg',
                              width: 190,
                              height: 125,
                              imagePadding: 0,
                              verticalMargin: 0,
                              textColor: Styles.BLACK_COLOR,
                              shownForwardArrow: false,
                              text: offerStore.offerMap.values
                                      .toList()[index]
                                      .description ??
                                  '',
                            )
                          ],
                        );
                      return ImageCard(
                        imgUrl: offerStore.offerMap.values
                                .toList()[index]
                                .offerUrl ??
                            'assets/offericon0.jpg',
                        width: 190,
                        height: 125,
                        imagePadding: 0,
                        verticalMargin: 0,
                        textColor: Styles.BLACK_COLOR,
                        shownForwardArrow: false,
                        text: offerStore.offerMap.values
                                .toList()[index]
                                .description ??
                            '',
                      );
                    }),
              );
            },
          ),
          getTitleTex("Categories"),
          GridView.builder(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              shrinkWrap: true,
              itemCount: StringValue.CATEGORY_LIST.length,
              itemBuilder: (BuildContext context, index) {
                return ImageCard(
                  onTap: () {
                    Navigator.pushNamed(
                        context, StringValue.CATEGORY_LIST[index]['route']);
                  },
                  imgUrl: StringValue.CATEGORY_LIST[index]['icon'],
                  horizontalMargin: 10,
                  verticalMargin: 0,
                  width: 90,
                  text: StringValue.CATEGORY_LIST[index]['title'],
                  boxFit: BoxFit.contain,
                  textAlign: TextAlign.center,
                );
              }),
          SizedBox(
            height: ScreenUtil.instance.setHeight(20),
          ),
        ],
      ),
    );
  }

  profileRow() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20),
          right: ScreenUtil.instance.setWidth(20),
          top: ScreenUtil.instance.setHeight(40)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: _navigateToMyAccountPage,
                child: Container(
                  height: ScreenUtil.instance.setWidth(40),
                  width: ScreenUtil.instance.setWidth(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Styles.MO_CONTACT_US,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Home',
                style: TextStyle(
                    color: Styles.BLACK_COLOR,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getBottomNavigationWidget(
      String icon, String slectedIcon, String title, bool isSelected) {
    return Container(
      height: ScreenUtil.instance.setHeight(50),
      width: ScreenUtil.instance.setWidth((ScreenUtil.instance.width) / 5),
      child: Column(
        children: <Widget>[
          Image.asset(
            isSelected ? slectedIcon : icon,
            height: ScreenUtil.instance.setHeight(20),
            width: ScreenUtil.instance.setWidth(40),
          ),
          Text(title),
          Container(
            height: ScreenUtil.instance.setHeight(5),
            width:
                ScreenUtil.instance.setWidth((ScreenUtil.instance.width) / 5),
            decoration: BoxDecoration(
                color: isSelected
                    ? Styles.PRIMARY_COLOR
                    : Styles.TRANSPARENT_COLOR,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(ScreenUtil.instance.setWidth(5)))),
          )
        ],
      ),
    );
  }

  _navigateToMyAccountPage() {
    Navigator.pushNamed(context, MyAccount.routeNamed);
  }
}
