import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../routes.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpaceLarge,
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: [AppText.headingOne("Hello Vendors!!")],
              ),
            ),
            verticalSpaceMedium,
            AppText.headline("Let's start with revolution"),
            verticalSpaceMedium,
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/vendor.png"),
                fit: BoxFit.fitHeight,
              )),
            ),
            verticalSpaceMedium,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: AppText.body(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.loginScreen),
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: AppText.buttonText("Get Started")),
            )
          ],
        ),
      ),
    );
  }
}
