import 'package:grocery/presentation/category_pages/clothes_page.dart';
import 'package:grocery/presentation/category_pages/essentials_page.dart';
import 'package:grocery/presentation/category_pages/fashion_page.dart';
import 'package:grocery/presentation/category_pages/footwear_page.dart';
import 'package:grocery/presentation/category_pages/kitchenware_page.dart';
import 'package:grocery/presentation/category_pages/mobile_page.dart';
import 'package:grocery/presentation/category_pages/sports_page.dart';
import 'package:grocery/presentation/category_pages/stationary_page.dart';
import 'package:grocery/presentation/contact_us.dart';
import 'package:grocery/presentation/history_pages/history_page.dart';
import 'package:grocery/presentation/my_account.dart';
import 'package:grocery/presentation/request_page.dart';
import 'package:grocery/utils/styles.dart';

abstract class StringValue {
  //APP TITLE
  static const String APP_TITLE = "Bolesale";

  static const String LOGIN_WITH_GOOGLE = 'Login with Google';
  static const String CONTINUE_AS_GUEST = 'Continue as Guest';
  static const String LOGIN_WITH_PHONE_NO = 'Login with Phone no.';

  static const String PLEASE_TRY_AGAIN_LATER = 'Please try again later';
  static const String SHOW_MORE_OPTION = 'Show More Option !';
  static const String HIDE_MORE_OPTION = 'Hide More Option !';
  static const String WHERE_TO_DELIVER = 'WHERE TO DELIVER ?';

  //Home Page
  static const List CATEGORY_LIST = [
    {
      'title': 'Clothing & Apparels',
      'icon': Styles.HOME_CLOTHES_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Essentials',
      'icon': Styles.HOME_ESSENTIALS_ICON,
      'route': EssentialsPage.routeNamed
    },
    {
      'title': 'Fashion Accessories, Bags & Fabrics',
      'icon': Styles.HOME_FASHION_ICON,
      'route': FashionPage.routeNamed
    },
    {
      'title': 'Footwear',
      'icon': Styles.HOME_FOOTWEAR_ICON,
      'route': FootwearPage.routeNamed
    },
    {
      'title': 'Home Decor & Kitchenware',
      'icon': Styles.HOME_KITCHENWARE_ICON,
      'route': KitchenwarePage.routeNamed
    },
    {
      'title': 'Mobiles & Electronics',
      'icon': Styles.HOME_MOBILE_ICON,
      'route': MobilePage.routeNamed
    },
    {
      'title': 'Toys & Sports Goods',
      'icon': Styles.HOME_SPORTS_ICON,
      'route': SportsPage.routeNamed
    },
    {
      'title': 'Stationery & Office Supplies',
      'icon': Styles.HOME_STATIONARY_ICON,
      'route': StationaryPage.routeNamed
    },
  ];
  static const String MORE_OPTIONS_TITLE = "More Options";
  static const List<Map<String, dynamic>> MORE_OPTIONS_LIST = [
    {
      'title': 'My Account',
      'image': Styles.MO_MY_ACCOUNT_ICON,
      'route': MyAccount.routeNamed,
    },
    {
      'title': 'History',
      'image': Styles.PENDING_REPORT_ICON,
      'route': HistoryPage.routeNamed
    },
    {
      'title': 'Request',
      'image': Styles.MO_FAQS,
      'route': RequestPage.routeNamed
    },
    {
      'title': 'Contact us',
      'image': Styles.MO_CONTACT_US,
      'route': ContactUs.routeNamed
    },
    {
      'title': 'Log Out',
      'image': Styles.MO_LOGOUT,
      'route': MyAccount.routeNamed
    },
  ];
}
