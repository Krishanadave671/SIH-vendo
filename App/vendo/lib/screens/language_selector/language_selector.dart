import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import 'package:vendo/util/string.dart';

import '../../routes.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String dropdownvalue = 'English';
  bool isVisible = false;

  // List of items in our dropdown menu
  var items = ['English', 'Hindi'];

  Future<void> languageConverter(dropdownvalue) async {
    if (dropdownvalue == "Hindi") {
      StringsList.language = "Hindi";
      StringsList.convert();
    }
  }

  bool loading() {
    setState(() {
      isVisible = !isVisible;
    });
    return isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: AppText.headingOne(
                  "Choose Language",
                ),
              ),
            ),

            verticalSpace(20),

            const Image(
              image: AssetImage("assets/images/languages.png"),
              height: 120,
            ),

            verticalSpace(40),

            //dropdown menu
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButton(
                isExpanded: true,
                //isDense: false,
                style: const TextStyle(
                  fontSize: 30,
                  color: colors.kcPrimaryTextColor,
                ),

                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),

            Expanded(
                child: Container(
              child: Visibility(
                visible: isVisible,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )),

            Padding(
              padding: const EdgeInsets.only(bottom: 60, right: 20),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () async {
                      loading();
                      languageConverter(dropdownvalue);
                      await Future.delayed(const Duration(seconds: 5), () {});
                      Navigator.of(context).pushNamed(Routes.welcomeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: colors.primary,
                    ),
                    child: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
