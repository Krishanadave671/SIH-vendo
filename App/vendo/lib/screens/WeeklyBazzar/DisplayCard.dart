import 'package:flutter/material.dart';
import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/colors.dart';

import '../../util/AppInterface/ui_helpers.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    Key? key,
    required this.weeklyBazzarModel,
  }) : super(key: key);
  final WeeklyBazzarModel weeklyBazzarModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //color: colors.primary,
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  AppText.containerText("Bazzar Name: "),
                  const SizedBox(
                    width: 10,
                  ),
                  AppText.containerText(weeklyBazzarModel.bazzarName),
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  AppText.containerText("Favourable Type: "),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AppText.containerText(
                      weeklyBazzarModel.vendorTypeFavourable.toString(),
                      isSingleLined: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
