import 'package:flutter/material.dart';
import 'package:vendo/Screens/Main_page/mainpage.dart';
import 'package:vendo/screens/getStarted_screen/getStarted.dart';
import 'package:vendo/screens/language_selector/language_selector.dart';
import 'package:vendo/screens/login/login_screen.dart';
import 'package:vendo/screens/registration/documentarty_evidence.dart';
import 'package:vendo/screens/registration/nationality_evidence.dart';
import 'package:vendo/screens/registration/register_view.dart';
import 'package:vendo/screens/registration/space_allocation.dart';
import 'package:vendo/screens/registration/space_allocation_list.dart';
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
        builder: (context) => const login_screen(),
      );
    case Routes.mainPage:
      return MaterialPageRoute(
        builder: (context) => const MainPage(),
      );
    case Routes.languageSelect:
      return MaterialPageRoute(
        builder: (context) => const language_selector(),
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

    default:
      return MaterialPageRoute(
        builder: (context) => const language_selector(),
      );
  }
}
