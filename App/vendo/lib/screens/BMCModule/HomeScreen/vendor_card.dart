import 'package:flutter/material.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

import '../../../util/AppFonts/app_text.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({Key? key, required this.location, required this.name})
      : super(key: key);

  final String location;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 240, 239, 223)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8),
          child: Column(
            children: [
              Row(
                children: [
                  AppText.body("Id: "),
                  AppText.body(name),
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  AppText.body("Feedback: "),
                  Expanded(child: AppText.body(location))
                ],
              ),
              verticalSpaceSmall
            ],
          ),
        ),
      ),
    );
  }
}
