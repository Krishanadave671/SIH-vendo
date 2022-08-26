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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Material(
        //elevation: 10,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            //border: Border.all(color: Colors.yellow),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //color: colors.primary,
            color: Color.fromARGB(255, 246, 210, 223),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    //AppText.bodyBold("Bazzar Name: "),
                    const Text(
                      "Bazar Name: ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //AppText.body(weeklyBazzarModel.bazzarName),
                    Text(
                      weeklyBazzarModel.bazzarName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    //AppText.bodyBold("Favourable Type: "),
                    const Text(
                      "Favourable type: ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AppText.body(
                        weeklyBazzarModel.vendorTypeFavourable
                            .toString()
                            .substring(
                                1,
                                weeklyBazzarModel.vendorTypeFavourable
                                        .toString()
                                        .length -
                                    1),
                        isSingleLined: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
