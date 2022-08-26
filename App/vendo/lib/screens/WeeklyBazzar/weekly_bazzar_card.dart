import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/models/vendorDetailsModel/vendor_details.dart';

import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../routes.dart';
import '../../services/dio_client.dart';

class WeeklyBazzarCard extends ConsumerStatefulWidget {
  WeeklyBazzarCard({Key? key, required this.model}) : super(key: key);
  WeeklyBazzarModel model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeeklyBazzarCardState();
}

class _WeeklyBazzarCardState extends ConsumerState<WeeklyBazzarCard> {
  @override
  Widget build(BuildContext context) {
    final weeklyBazzar = widget.model;
    var vendorDetails = ref.read(vendordetailsProvider);

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: getBody(weeklyBazzar, vendorDetails),
    );
  }

  Widget getBody(WeeklyBazzarModel weeklyBazzar, VendorModel vendorDetails) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.dstATop,
                    ),
                    image: NetworkImage(weeklyBazzar.bazzarImageUrl),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    weeklyBazzar.bazzarImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  verticalSpaceMedium,
                  AppText.headline(weeklyBazzar.bazzarName),
                  verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                        child: AppText.body(weeklyBazzar.bazzarAddress),
                      )
                    ],
                  ),
                  spacedDivider,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bodyBold("Description"),
                      verticalSpaceSmall,
                      Row(
                        children: [
                          Expanded(
                            child: AppText.body(weeklyBazzar.bazzarDescription),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  AppText.bodyBold("Details"),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      AppText.body(
                          "Available slots : ${weeklyBazzar.bazzarMaximumCapacity}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      AppText.body("Date : ${weeklyBazzar.bazzarDate}"),
                    ],
                  ),
                  verticalSpaceMedium,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    onPressed: () async {
                      try {
                        //api to register for the weekly Bazzar
                        final _api = ref.watch(apiserviceProvider);
                        var response = await _api.registerBazzar(
                            weeklyBazzar.bazzarId,
                            vendorDetails.vendorId,
                            weeklyBazzar.bazzarName,
                            context);

                        await _api.getuserData(context, ref);
                      } on Exception catch (e) {
                        log(e.toString());
                      }

                      Navigator.of(context).pop();
                    },
                    child: AppText.body(
                      "Register Now",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
