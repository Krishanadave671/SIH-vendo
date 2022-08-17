import 'package:flutter/material.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../routes.dart';

class VendingZoneCard extends StatefulWidget {
  VendingZoneCard({Key? key, required this.vendingZone}) : super(key: key);
  VendingzoneModel vendingZone;

  @override
  State<VendingZoneCard> createState() => _VendingZoneCardState();
}

class _VendingZoneCardState extends State<VendingZoneCard> {
  @override
  Widget build(BuildContext context) {
    final vendingZone = widget.vendingZone;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: getBody(vendingZone),
    );
  }

  Widget getBody(VendingzoneModel vendingZone) {
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
                    image: NetworkImage(vendingZone.vendingzoneImageurl),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    vendingZone.vendingzoneImageurl,
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
                  AppText.headline(vendingZone.vendingzonestreetName),
                  verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                        child: AppText.body(vendingZone.vendingzonelocation),
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
                            child: AppText.body(
                                vendingZone.vendingzonedescription),
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
                          "Available slots : ${vendingZone.maximumVendorsallowed}"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      AppText.body(
                          "Location Fee : ${vendingZone.vendingzonelocationtax}"),
                    ],
                  ),
                  verticalSpaceMedium,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.mainPage, (route) => false);
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
