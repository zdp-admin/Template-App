import 'package:template/pages/assist/assist_page.dart';
import 'package:template/pages/detailspromotions/details_promotion_page.dart';
import 'package:template/pages/listbranchs/list_branch_page.dart';
import 'package:template/pages/login/login_page.dart';
import 'package:template/pages/noticeofprivacity/notice_of_privacity_page.dart';
import 'package:template/pages/profile/profile_page.dart';
import 'package:template/pages/promozone/promo_zone_page.dart';
import 'package:template/pages/welcomecard/welcome_card_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'login':
      return MaterialPageRoute(
          builder: (context) => LoginPage(), settings: settings);
      break;
    case 'profile':
      return MaterialPageRoute(
          builder: (context) => ProfilePage(), settings: settings);
      break;
    case 'welcome':
      return MaterialPageRoute(
          builder: (context) => WelcomeCardPage(), settings: settings);
      break;
    case 'promo-zone':
      return MaterialPageRoute(
          builder: (context) => PromoZonePage(), settings: settings);
      break;
    case 'details-promotion':
      return MaterialPageRoute(
          builder: (context) => DetailsPromotionPage(), settings: settings);
      break;
    case 'list-branchs':
      return MaterialPageRoute(
          builder: (context) => ListBranchPage(), settings: settings);
      break;
    case 'assits':
      return MaterialPageRoute(
          builder: (context) => AssistPage(), settings: settings);
      break;
    case 'notice-privacity':
      return MaterialPageRoute(
          builder: (context) => NoticeOfPrivacityPage(), settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (context) => LoginPage(), settings: settings);
  }
}
