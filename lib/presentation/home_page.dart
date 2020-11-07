import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/cart_page.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/more_page.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/search_page.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';

import '../utils/styles.dart';

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
        drawer: MorePage(),
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: _navigateToMyAccountPage,
              child: Image.asset(
                Styles.MO_CONTACT_US,
                fit: BoxFit.contain,
                width: ScreenUtil.instance.setWidth(30),
                height: ScreenUtil.instance.setWidth(30),
                color: Styles.WHITE_COLOR,
              ),
            ),
            SizedBox(
              width: ScreenUtil.instance.setWidth(20),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = currentPage == 0 ? 2 : 0;
                });
              },
              child: Image.asset(
                currentPage == 0
                    ? Styles.BNI_CART_SELECTED_ICON
                    : Styles.BNI_HOME_SELECTED_ICON,
                fit: BoxFit.contain,
                width: ScreenUtil.instance.setWidth(30),
                height: ScreenUtil.instance.setWidth(30),
                color: Styles.WHITE_COLOR,
              ),
            ),
            SizedBox(
              width: ScreenUtil.instance.setWidth(20),
            ),
          ],
        ),
        backgroundColor: Styles.WHITE_COLOR,
        body: currentPage == 2
            ? CartPage()
            : currentPage == 1
                ? SearchPage()
                : homeWidget(),
      ),
    );
  }

  homeWidget() {
    return CustomScaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 1;
                });
              },
              child: IgnorePointer(
                  child: SearchBar(
                hintText: "Search For A product",
                icon: Icons.search,
                onSearch: (value) {
                  print(value);
                },
              )),
            ),
            getTitleTex("Categories"),
            GridView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
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
                    imageColor: Styles.SECONDARY_COLOR,
                    width: 130,
                    text: StringValue.CATEGORY_LIST[index]['title'],
                    boxFit: BoxFit.contain,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  );
                }),
            SizedBox(
              height: ScreenUtil.instance.setHeight(20),
            ),
          ],
        ),
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
            color: Styles.PRIMARY_COLOR,
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
