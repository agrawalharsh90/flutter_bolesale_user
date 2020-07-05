import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/category_pages/clothes_page.dart';
import 'package:grocery/presentation/contact_us.dart';
import 'package:grocery/presentation/custom/webview_scaffold.dart';
import 'package:grocery/presentation/history_pages/combo_history_page.dart';
import 'package:grocery/presentation/history_pages/history_page.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/phone_auth_page.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/clothes_store.dart';
import 'package:grocery/store/offer_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Grocery());
}

class Grocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
        Provider<ClothesStore>.value(value: ClothesStore()),
        Provider<CartStore>.value(value: CartStore()),
        Provider<AddressStore>.value(value: AddressStore()),
        Provider<OrderStore>.value(value: OrderStore()),
        Provider<OfferStore>.value(value: OfferStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Styles.WHITE_COLOR,
            primaryColor: Styles.PRIMARY_COLOR),
        initialRoute: SplashPage.routeNamed,
        routes: {
          SplashPage.routeNamed: (BuildContext context) => SplashPage(),
          HomePage.routeNamed: (BuildContext context) => HomePage(),
          MyAccount.routeNamed: (BuildContext context) => MyAccount(),
          BasketPage.routeNamed: (BuildContext context) => BasketPage(),
          ClothesPage.routeNamed: (BuildContext context) =>
              ClothesPage(),
          PhoneAuthPage.routeNamed: (BuildContext context) =>
              Scaffold(body: PhoneAuthPage()),
          AddressEditPage.routeNamed: (BuildContext context) => Scaffold(
                body: AddressEditPage(),
              ),
          HistoryPage.routeNamed: (BuildContext context) => HistoryPage(),
          WebviewScaffold.routeNamed: (BuildContext context) =>
              WebviewScaffold(),
          ComboHistoryPage.routeNamed: (BuildContext context) =>
              ComboHistoryPage(),
          ContactUs.routeNamed: (BuildContext context) => ContactUs(),
        },
      ),
    );
  }
}
