import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:vendo/Screens/Main_page/mainpage.dart';
import 'package:vendo/Screens/registration/space_allocation_list.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/Screens/login/login_screen2.dart';

import 'package:vendo/screens/BMCModule/HomeScreen/BottomNavBar/bottom_nav.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/home_page.dart';
import 'package:vendo/screens/BMCModule/VendorReview/vendor_check.dart';
import 'package:vendo/screens/getStarted_screen/getStarted.dart';
import 'package:vendo/screens/language_selector/language_selector.dart';
import 'package:vendo/screens/login/login_screen.dart';
import 'package:vendo/screens/registration/approval_page.dart';
import 'package:vendo/screens/registration/documentarty_evidence.dart';
import 'package:vendo/screens/registration/nationality_evidence.dart';
import 'package:vendo/screens/registration/register_view.dart';
import 'package:vendo/screens/registration/space_allocation.dart';

import 'package:vendo/screens/registration/vending_zone_view.dart';
import 'package:vendo/screens/write_Complaints_screen/complaints.dart';
import 'Screens/calendar_screen/calendar.dart';

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
  static const test = '/test';
  static const vendingZoneCard = '/vending_zone_card';
  static const apporvalPage = '/approval_page_view';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.calendarScreen:
      return MaterialPageRoute(
        builder: (context) => Calendar(
          title: "Krishana",
        ),
      );
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
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
  });
  final String shopName;
  final String vendorLocation;
  final String expiry;
  final String phoneNo;
}

class VendingZoneViewArguments {
  VendingZoneViewArguments({
    required this.model,
  });
  final VendingzoneModel model;
}
