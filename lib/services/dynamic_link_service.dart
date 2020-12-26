import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/presentation/display_product_widget.dart';
import 'package:grocery/utils/globals.dart';
import 'package:share/share.dart';

class DynamicLinkService {
  DynamicLinkService._();

  factory DynamicLinkService.getInstance() => _instance;

  static final DynamicLinkService _instance = DynamicLinkService._();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  navigateTo(String routeName, ScreenArguments arguments) {
    return navigatorKey.currentState.push(MaterialPageRoute(builder: (BuildContext context)=>DisplayProductWidget()));
  }

  Future<Map<String, String>> handleDynamicLinks() async {
    Map<String, String> url;
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    url = _handleDeepLink(data);
    if (url != null && url.isNotEmpty) return url;

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      url = _handleDeepLink(dynamicLink);
      print(url);
      LoggedInUser user = await preferenceService.getAuthUser();
      if (user != null) {
//          navigateTo(
//              DisplayProductWidget,
//              ScreenArguments(
//                cheerId: url['instaCelebrationId'],
//                themeId: url['instaThemeId'],
//                title: url['title'],
//                isBack: false,
//              ));
      }
      return url;
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  Map<String, String> _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print("Handle deep link" + deepLink.toString());
      print('data from dynamic link');
      print(deepLink.queryParameters);
      return deepLink.queryParameters;
    }
  }

  Future<String> createShareProductLink(
      {String productId,
      String categoryId,
      String subCategoryId,
      String msg = 'Have a look on amazing product on Bolesale\n'}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://bolesale.page.link',
      link: Uri.parse('https://bolesale.com?' +
          'productId=${productId}&subCategoryId=${subCategoryId}&categoryId=${categoryId}'),
      androidParameters: AndroidParameters(
        packageName: 'com.bolesale.main',
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();
    print("dynamicUrl");
    print(productId);
    print(dynamicUrl.toString());
    Share.share(msg + '\n' + dynamicUrl.toString());
  }
}
