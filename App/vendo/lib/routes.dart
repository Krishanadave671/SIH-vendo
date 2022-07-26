import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:vendo/Screens/Main_page/mainpage.dart';
import 'package:vendo/Screens/registration/space_allocation_list.dart';
import 'package:vendo/models/governmentSchemeModel/government_scheme_model.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';

import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';

import 'package:vendo/screens/BMCModule/HomeScreen/BottomNavBar/bottom_nav.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/home_page.dart';

import 'package:vendo/screens/BMCModule/VendorReview/vendor_review.dart';
import 'package:vendo/screens/BMCModule/VendorReview/where_to_go.dart';
import 'package:vendo/screens/Homescreen/screens/widgets/my_reviews.dart';

import 'package:vendo/screens/Notification_screen/notification_screen.dart';
import 'package:vendo/screens/WeeklyBazzar/my_weekly_bazzars.dart';
import 'package:vendo/screens/WeeklyBazzar/weekly_bazzar.dart';
import 'package:vendo/screens/WeeklyBazzar/weekly_bazzar_card.dart';
import 'package:vendo/screens/Write_complaints_screen/complaints_list.dart';
import 'package:vendo/screens/getStarted_screen/getStarted.dart';
import 'package:vendo/screens/incentive_detail/incentive_detail.dart';
import 'package:vendo/screens/incentive_lists/incentive_list.dart';
import 'package:vendo/screens/language_selector/language_selector.dart';
import 'package:vendo/screens/login/login_screen.dart';
import 'package:vendo/screens/my_credit/MyCredit.dart';
import 'package:vendo/screens/registration/approval_page.dart';
import 'package:vendo/screens/registration/documentarty_evidence.dart';
import 'package:vendo/screens/registration/nationality_evidence.dart';
import 'package:vendo/screens/registration/register_view.dart';
import 'package:vendo/screens/registration/space_allocation.dart';

import 'package:vendo/screens/registration/vending_zone_view.dart';
import 'package:vendo/screens/scheme_details/SchemeDetails.dart';
import 'package:vendo/screens/splash_screen.dart';
import 'package:vendo/screens/write_Complaints_screen/complaints.dart';
import 'package:vendo/util/AppInterface/appapplied.dart';

class Routes {
  static const calendarScreen = '/calendar_screen';
  static const loginScreen = '/login_screen';
  static const mainPage = '/main_page';

  static const languageSelect = '/languageSelect_screen';
  static const welcomeScreen = '/welcome_screen';
  static const spaceallocation = '/space_allocation_screen';
  static const spaceallocationList = '/space_allocation_list_screen';
  static const documentaryEvidence = '/documentary_evidence_screen';
  static const nationalityEvidence = '/nationality_evidence_screen';
  static const registerView = '/register_view';
  static const complaintPage = '/complaint_page';
  static const bmcMainPage = '/bmc_main_page';
  static const vendorCheck = '/vendor_check';
  static const bmcNavBar = '/bmc_nav_bar';
  static const whereTo = '/test';
  static const vendingZoneCard = '/vending_zone_card';
  static const apporvalPage = '/approval_page_view';
  static const notificationScreen = '/notification_screen';
  static const splashScreen = '/splash_screen';
  static const schemeDetails = '/scheme_details';
  static const weeklyBazzarCard = '/weekly_bazzar_card';
  static const incentiveDetails = '/incentive_detail';
  static const complaintsList = '/complaints_list';
  // static const approvedPage = '/approvedPage';
  static const bazzarList = '/bazzar_list_view';
  static const availableIncentives = '/available_incentives';
  static const myCreditScore = '/my_credit_score_screen';
  static const myReviews = '/my_reviews_view';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.calendarScreen:
      return MaterialPageRoute(
        builder: (context) => const Calendar(
          title: "Krishana",
        ),
      );
    case Routes.schemeDetails:
      final args = settings.arguments as SchemeArguments;
      return MaterialPageRoute(
        builder: (context) => SchemeDetails(
          governmentSchemeModel: args.model,
        ),
      );
    case Routes.myCreditScore:
      return MaterialPageRoute(
        builder: (context) => const MyCreditScore(),
      );
    case Routes.availableIncentives:
      return MaterialPageRoute(
        builder: (context) => const AvailableIncentives(),
      );
    case Routes.incentiveDetails:
      return MaterialPageRoute(
        builder: (context) => const IncentiveDetail(),
      );
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case Routes.notificationScreen:
      return MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      );
    case Routes.mainPage:
      return MaterialPageRoute(
        builder: (context) => const MainPage(),
      );
    case Routes.languageSelect:
      return MaterialPageRoute(
        builder: (context) => const LanguageSelector(),
      );
    case Routes.welcomeScreen:
      return MaterialPageRoute(
        builder: (context) => const getStarted(),
      );
    case Routes.spaceallocation:
      return MaterialPageRoute(
        builder: (context) => const SpaceAllocation(),
      );
    case Routes.spaceallocationList:
      return MaterialPageRoute(
        builder: (context) => const SpaceAllocationListView(),
      );

    case Routes.documentaryEvidence:
      return MaterialPageRoute(
        builder: (context) => const DocumentaryEvidence(),
      );
    case Routes.nationalityEvidence:
      return MaterialPageRoute(
        builder: (context) => const NationalityEvidence(),
      );
    case Routes.registerView:
      return MaterialPageRoute(
        builder: (context) => const RegisterView(),
      );
    case Routes.complaintPage:
      return MaterialPageRoute(
        builder: (context) => AddComplaints(),
      );
    case Routes.bmcNavBar:
      return MaterialPageRoute(
        builder: (context) => const BMCBottomNav(),
      );
    case Routes.bmcMainPage:
      return MaterialPageRoute(
        builder: (context) => const BMCHomePage(),
      );

    case Routes.vendorCheck:
      final args = settings.arguments as VendorCheckArguments;
      return MaterialPageRoute(
        builder: (context) => VendorCheck(
          expiry: args.expiry,
          shopName: args.shopName,
          vendorLocation: args.vendorLocation,
          phoneNo: args.phoneNo,
          id: args.id,
        ),
      );
    case Routes.vendingZoneCard:
      final args = settings.arguments as VendingZoneViewArguments;
      return MaterialPageRoute(
        builder: (context) => VendingZoneCard(
          vendingZone: args.model,
        ),
      );
    case Routes.apporvalPage:
      return MaterialPageRoute(
        builder: (context) => const ApprovalPage(),
      );

    case Routes.weeklyBazzarCard:
      final args = settings.arguments as WeeklyBazzarCardArguments;
      return MaterialPageRoute(
        builder: (context) => WeeklyBazzarCard(
          model: args.model,
        ),
      );
    case Routes.complaintsList:
      return MaterialPageRoute(
        builder: (context) => const ComplaintsList(),
      );
    case Routes.bazzarList:
      return MaterialPageRoute(
        builder: (context) => const MyBazzars(),
      );
    case Routes.whereTo:
      return MaterialPageRoute(
        builder: (context) => const WhereToDirect(),
      );
    case Routes.myReviews:
      return MaterialPageRoute(builder: (context) => const MyReviews());

    default:
      return MaterialPageRoute(
        builder: (context) => const BMCBottomNav(),
      );
  }
}

class VendorCheckArguments {
  VendorCheckArguments({
    required this.shopName,
    required this.expiry,
    required this.vendorLocation,
    required this.phoneNo,
    required this.id,
  });
  final String shopName;
  final String vendorLocation;
  final String expiry;
  final String phoneNo;
  final String id;
}

class VendingZoneViewArguments {
  VendingZoneViewArguments({
    required this.model,
  });
  final VendingzoneModel model;
}

class SchemeArguments {
  SchemeArguments({
    required this.model,
  });
  final GovernmentSchemeModel model;
}

class WeeklyBazzarCardArguments {
  WeeklyBazzarCardArguments({
    required this.model,
  });
  final WeeklyBazzarModel model;
}
