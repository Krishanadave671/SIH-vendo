import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class language_selector extends StatefulWidget {
  const language_selector({Key? key}) : super(key: key);


  @override
  State<language_selector> createState() => _language_selectorState();
}

class _language_selectorState extends State<language_selector> {
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  var items = [
    'English',
    'Hindi'
  ];

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
              image: AssetImage("lib/assets/images/languages.png"),
              height: 120,
            ),

            verticalSpace(40),

            //dropdown menu
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
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

            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(bottom: 60,right: 20),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: ()=> Navigator.of(context).pushNamed('/welcome_screen'),
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


