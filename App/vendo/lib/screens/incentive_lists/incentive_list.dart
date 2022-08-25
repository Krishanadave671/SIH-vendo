import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vendo/models/incentive_list_model.dart';
import 'package:vendo/screens/incentive_lists/incentive_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class AvailableIncentives extends StatefulWidget {
  const AvailableIncentives({Key? key}) : super(key: key);

  @override
  State<AvailableIncentives> createState() => _AvailableIncentivesState();
}

class _AvailableIncentivesState extends State<AvailableIncentives> {
  List<IncentiveListModel> incentiveList = [
    IncentiveListModel("PM Svanidhi Scheme",
        "Ministry of Housing & Urban Affairs launched a scheme PM Street Vendor's AtmaNirbhar Nidhi."),
    IncentiveListModel("Main bhi Digital 3.0",
        "Digital onboarding and training of Street Vendors (SVs) is an integral part of PM Street Vendor’s AtmaNirbharNidhi (PM SVANidhi) Scheme. Lending Institutions (LIs) have been instructed to issue a durable QR Code & UPI ID at the time of disbursement and train the beneficiaries in conduct of digital transactions."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
    // IncentiveListModel("Incentive Topic",
    //     "Hard work boosted with some motivation can lead to great results."),
  ];

  bool listAvailable = true;
  Widget checkIncentives() {
    if (listAvailable == true) {
      return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: incentiveList.length,
            itemBuilder: ((context, index) {
              return IncentiveCard(
                incentiveTopic: incentiveList[index].topic,
                incentiveDescription: incentiveList[index].description,
              );
            })),
      );
    } else {
      return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.yellow[300]),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Looks like no incentives are available for the time.\n\nIncrease your credit score and try again.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image(
                    image: NetworkImage(
                        "https://learn.g2.com/hs-fs/hubfs/iStock-1227315898.jpg?width=5000&name=iStock-1227315898.jpg")),
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.white, width: 5)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Checkout available\nincentives below",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              //border: Border.all(color: Colors.white, width: 5)
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Work hard and be motivated",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                AppText.headingOne("Incentives"),
              ],
            ),
          ),
          checkIncentives(),
        ],
      ),
    );
  }
}
