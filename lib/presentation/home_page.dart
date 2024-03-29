import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/cart_page.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/presentation/drawer_page.dart';
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
  LoggedInUser loggedInUser;
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
        drawer: DrawerPage(),
        appBar: AppBar(
          title: Text(
            currentPage == 2 ? 'Cart' : 'Bolesale',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Styles.WHITE_COLOR),
            textAlign: TextAlign.left,
          ),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = currentPage == 0 ? 2 : 0;
                });
              },
              child: Icon(
                currentPage == 0 ? Icons.shopping_cart : Icons.home,
                size: ScreenUtil.instance.setWidth(30),
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
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
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
                    width: 130,
                    text: StringValue.CATEGORY_LIST[index]['title'],
                    boxFit: BoxFit.contain,
                    textAlign: TextAlign.center,
                    textColor: Styles.BLACK_COLOR,
                    color: Styles.TRANSPARENT_COLOR,
                    fontSize: 16,
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
}
