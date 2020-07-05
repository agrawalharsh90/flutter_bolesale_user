import 'package:grocery/presentation/category_pages/construction_page.dart';
import 'package:grocery/presentation/category_pages/food/food_page.dart';
import 'package:grocery/presentation/category_pages/groceries_page.dart';
import 'package:grocery/presentation/category_pages/helping_hand/helping_hands_page.dart';
import 'package:grocery/presentation/category_pages/medical/medical_page.dart';
import 'package:grocery/presentation/category_pages/raw_non_veg/raw_non_veg.dart';
import 'package:grocery/presentation/category_pages/sweet_cake_page.dart';
import 'package:grocery/presentation/category_pages/veg_fruits_page.dart';
import 'package:grocery/presentation/category_pages/water/water.dart';
import 'package:grocery/presentation/contact_us.dart';
import 'package:grocery/presentation/custom/webview_scaffold.dart';
import 'package:grocery/presentation/history_pages/combo_history_page.dart';
import 'package:grocery/presentation/history_pages/grocery_list.dart';
import 'package:grocery/presentation/history_pages/helping_hand_history.dart';
import 'package:grocery/presentation/history_pages/history_page.dart';
import 'package:grocery/presentation/history_pages/medical_history_page.dart';
import 'package:grocery/presentation/history_pages/water_history.dart';
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
      'title': 'Groceries',
      'icon': Styles.HOME_GROCERIES_ICON,
      'route': GroceriesPage.routeNamed
    },
    {
      'title': 'Food',
      'icon': Styles.HOME_FOOD_ICON,
      'route': FoodPage.routeNamed
    },
    {
      'title': 'Sweets And Cakes',
      'icon': Styles.HOME_SWEETS_AND_CAKES_ICON,
      'route': SweetCakePage.routeNamed
    },
    {
      'title': 'Vegetables And Fruits',
      'icon': Styles.HOME_VEGITABLE_FRUITS_ICON,
      'route': VegFruitsPage.routeNamed
    },
    {
      'title': 'Water',
      'icon': Styles.HOME_WATER_ICON,
      'route': WaterPage.routeNamed
    },
    {
      'title': 'Raw Non-Veg',
      'icon': Styles.HOME_RAW_NON_VEG_ICON,
      'route': RawNonVeg.routeNamed
    },
    {
      'title': 'Helping Hands',
      'icon': Styles.HOME_HELPING_HANDS_ICON,
      'route': HelpingHands.routeNamed
    },
    {
      'title': 'Medical',
      'icon': Styles.HOME_MEDICAL_ICON,
      'route': MedicalPage.routeNamed
    },
    {
      'title': 'Construction Material',
      'icon': Styles.HOME_CONSTRUCTION_MATERIAL_ICON,
      'route': ConstructionPage.routeNamed
    },
  ];

  //Helping Hands
  static const List HELPING_HAND_CATEGORY = [
    {'title': 'Electrician', 'icon': Styles.HH_ELECTRICIANS_ICONS},
    {'title': 'Plumber', 'icon': Styles.HH_PLUMBER_ICONS},
    {'title': 'Water Filter Expert', 'icon': Styles.HH_WATER_FILTER_ICONS},
    {'title': 'Carpenter', 'icon': Styles.HH_CARPENTER_ICONS},
    {'title': 'Party Decorator', 'icon': Styles.HH_PARTY_DECORATOR_ICONS},
    {'title': 'Trainers', 'icon': Styles.HH_TRAINER_ICONS},
    {'title': 'Teachers', 'icon': Styles.HH_TEACHER_ICONS},
    {'title': 'Car Repair', 'icon': Styles.HH_CAR_REPAIR_ICONS},
    {'title': 'Beauticians', 'icon': Styles.HH_BEAUTICIANS_ICONS},
    {'title': 'Mason', 'icon': Styles.HH_MASON_ICONS},
    {'title': 'Salon', 'icon': Styles.HH_SALON_ICONS},
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
      'title': 'Medical History',
      'route': MedicalHistoryPage.routeNamed,
    },
    {
      'title': 'Helping Hands History',
      'route': HelpingHandHistoryPage.routeNamed,
    },
    {
      'title': 'Water History',
      'route': WaterHistoryPage.routeNamed,
    },
    {
      'title': 'Grocery List',
      'route': GroceryListHistoryPage.routeNamed,
    },
    {
      'title': 'Other History',
      'route': ComboHistoryPage.routeNamed,
    },
  ];
  static const String REGISTER_AS_HELPER = "Register as Helper";
  static const String REGISTER_AS_VENDOR = "Register as Vendor";
}
