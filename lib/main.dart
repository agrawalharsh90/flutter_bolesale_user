import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/presentation/about/about_page.dart';
import 'package:grocery/presentation/about/details_page.dart';
import 'package:grocery/presentation/about/pdf_page.dart';
import 'package:grocery/presentation/address_edit_page.dart';
import 'package:grocery/presentation/basket_page.dart';
import 'package:grocery/presentation/category_pages/clothes_page.dart';
import 'package:grocery/presentation/category_pages/essentials_page.dart';
import 'package:grocery/presentation/category_pages/fashion_page.dart';
import 'package:grocery/presentation/category_pages/footwear_page.dart';
import 'package:grocery/presentation/category_pages/kitchenware_page.dart';
import 'package:grocery/presentation/category_pages/mobile_page.dart';
import 'package:grocery/presentation/category_pages/sports_page.dart';
import 'package:grocery/presentation/category_pages/stationary_page.dart';
import 'package:grocery/presentation/contact_us.dart';
import 'package:grocery/presentation/custom/webview_scaffold.dart';
import 'package:grocery/presentation/history_pages/history_page.dart';
import 'package:grocery/presentation/home_page.dart';
import 'package:grocery/presentation/login_page.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/request_page.dart';
import 'package:grocery/presentation/splash_page.dart';
import 'package:grocery/presentation/user_details_edit.dart';
import 'package:grocery/services/dynamic_link_service.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/store/categories_store/clothes_store.dart';
import 'package:grocery/store/categories_store/essentials_store.dart';
import 'package:grocery/store/categories_store/fashion_store.dart';
import 'package:grocery/store/categories_store/footwear_store.dart';
import 'package:grocery/store/categories_store/kitchenware_store.dart';
import 'package:grocery/store/categories_store/mobile_store.dart';
import 'package:grocery/store/categories_store/sports_store.dart';
import 'package:grocery/store/categories_store/stationary_store.dart';
import 'package:grocery/store/offer_store.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/store/request_store.dart';
import 'package:grocery/store/user_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerLazySingleton(() => dynamicLinkService);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BoleSale());
  });
}

class BoleSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
        Provider<ClothesStore>.value(value: ClothesStore()),
        Provider<EssentialsStore>.value(value: EssentialsStore()),
        Provider<FashionStore>.value(value: FashionStore()),
        Provider<FootwearStore>.value(value: FootwearStore()),
        Provider<KitchenwareStore>.value(value: KitchenwareStore()),
        Provider<MobileStore>.value(value: MobileStore()),
        Provider<SportsStore>.value(value: SportsStore()),
        Provider<StationaryStore>.value(value: StationaryStore()),
        Provider<CartStore>.value(value: CartStore()),
        Provider<AddressStore>.value(value: AddressStore()),
        Provider<OrderStore>.value(value: OrderStore()),
        Provider<OfferStore>.value(value: OfferStore()),
        Provider<RequestStore>.value(value: RequestStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Styles.WHITE_COLOR,
            primaryColor: Styles.PRIMARY_COLOR),
        initialRoute: SplashPage.routeNamed,
        navigatorKey: locator<DynamicLinkService>().navigatorKey,
        routes: {
          SplashPage.routeNamed: (BuildContext context) => SplashPage(),
          HomePage.routeNamed: (BuildContext context) => HomePage(),
          MyAccount.routeNamed: (BuildContext context) => MyAccount(),
          BasketPage.routeNamed: (BuildContext context) => BasketPage(),
          ClothesPage.routeNamed: (BuildContext context) => ClothesPage(),
          EssentialsPage.routeNamed: (BuildContext context) => EssentialsPage(),
          FashionPage.routeNamed: (BuildContext context) => FashionPage(),
          FootwearPage.routeNamed: (BuildContext context) => FootwearPage(),
          KitchenwarePage.routeNamed: (BuildContext context) =>
              KitchenwarePage(),
          MobilePage.routeNamed: (BuildContext context) => MobilePage(),
          SportsPage.routeNamed: (BuildContext context) => SportsPage(),
          StationaryPage.routeNamed: (BuildContext context) => StationaryPage(),
          LoginPage.routeNamed: (BuildContext context) =>
              Scaffold(body: LoginPage()),
          AddressEditPage.routeNamed: (BuildContext context) => Scaffold(
                body: AddressEditPage(),
              ),
          HistoryPage.routeNamed: (BuildContext context) => HistoryPage(),
          WebviewScaffold.routeNamed: (BuildContext context) =>
              WebviewScaffold(),
          ContactUs.routeNamed: (BuildContext context) => ContactUs(),
          AboutPage.routeNamed: (BuildContext context) => AboutPage(),
          DetailsPage.routeNamed: (BuildContext context) => DetailsPage(),
          PdfPage.routeNamed: (BuildContext context) => PdfPage(),
          RequestPage.routeNamed: (BuildContext context) =>
              Scaffold(body: RequestPage()),
          UserDetailsEdit.routeNamed: (BuildContext context) =>
              Scaffold(body: UserDetailsEdit()),
        },
      ),
    );
  }
}
