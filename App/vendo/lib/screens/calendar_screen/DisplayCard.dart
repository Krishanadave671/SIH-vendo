import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/colors.dart';

import '../../util/AppInterface/ui_helpers.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({Key? key, required this.Location, required this.Time})
      : super(key: key);
  final String Location;
  final String Time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: colors.primary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppText.containerText("Location: "),
              const SizedBox(
                width: 10,
              ),
              AppText.containerText(Location),
            ],
          ),
          verticalSpaceMedium,
          Row(
            children: [
              AppText.containerText("Time: "),
              const SizedBox(
                width: 10,
              ),
              AppText.containerText(Time),
            ],
          ),
        ],
      ),
    );
  }
}
