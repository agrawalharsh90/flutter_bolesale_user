import 'package:grocery/presentation/category_pages/clothes_page.dart';
import 'package:grocery/presentation/contact_us.dart';
import 'package:grocery/presentation/custom/webview_scaffold.dart';
import 'package:grocery/presentation/history_pages/combo_history_page.dart';
import 'package:grocery/presentation/history_pages/history_page.dart';
import 'package:grocery/presentation/my_account.dart';
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
      'title': 'Clothes',
      'icon': Styles.HOME_GROCERIES_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Essentials',
      'icon': Styles.HOME_FOOD_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Fashion',
      'icon': Styles.HOME_SWEETS_AND_CAKES_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Footwear',
      'icon': Styles.HOME_VEGITABLE_FRUITS_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Kitchenware',
      'icon': Styles.HOME_WATER_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Mobile',
      'icon': Styles.HOME_RAW_NON_VEG_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Sports',
      'icon': Styles.HOME_HELPING_HANDS_ICON,
      'route': ClothesPage.routeNamed
    },
    {
      'title': 'Stationary',
      'icon': Styles.HOME_MEDICAL_ICON,
      'route': ClothesPage.routeNamed
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
//    {
//      'title': 'Invite',
//      'image': Styles.MO_INVITE,
//      'route': MyAccount.routeNamed
//    },
    {
      'title': 'Terms',
      'image': Styles.MO_POLICY,
      'route': WebviewScaffold.routeNamed,
      'url': 'https://sahayta-center.web.app/terms.html',
    },
    {
      'title': 'Privacy Policy',
      'image': Styles.MO_POLICY,
      'route': WebviewScaffold.routeNamed,
      'url': 'https://sahayta-center.web.app/privacy-policy.html',
    },
    {
      'title': 'About Us',
      'image': Styles.MO_FAQS,
      'route': WebviewScaffold.routeNamed,
      'url': 'https://sahayta-center.web.app/about-us.html',
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
  static const List<Map<String, dynamic>> HISTORY_OPTIONS_LIST = [
    {
      'title': 'Other History',
      'route': ComboHistoryPage.routeNamed,
    },
  ];
}
