import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class VendingZoneCard extends StatefulWidget {
  const VendingZoneCard({Key? key}) : super(key: key);

  @override
  State<VendingZoneCard> createState() => _VendingZoneCardState();
}

class _VendingZoneCardState extends State<VendingZoneCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: getBody(),
    );
  }

  Widget getBody() {
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
                    image: const NetworkImage(
                        "https://assets.devfolio.co/hackathons/d2e152245d8146898efc542304ef6653/assets/cover/694.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    "https://assets.devfolio.co/hackathons/d2e152245d8146898efc542304ef6653/assets/cover/694.png",
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
                  AppText.headline("Dahisar Market"),
                  verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.location_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                        child: AppText.body(
                            "A/103, Sortee Somnath, Kanderpada, Dahisar(W), Mumbai - 400068"),
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
                                "Nobody wants to stare at a blank wall all day long, which is why wall art is such a crucial step in the decorating process. And once you start brainstorming, the rest is easy. From gallery walls to DIY pieces like framing your accessories and large-scale photography, we've got plenty of wall art ideas to spark your creativity. And where better to look for inspiration that interior designer-decorated walls"),
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
                      AppText.body("Available slots : 45"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: colors.primary,
                      ),
                      horizontalSpaceSmall,
                      AppText.body("Location Fee : 20000"),
                    ],
                  ),
                  verticalSpaceMedium,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    onPressed: () {},
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
