import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/providers/weekly_bazzar_provider.dart';
import 'package:vendo/screens/WeeklyBazzar/DisplayCard.dart';
import 'package:vendo/screens/WeeklyBazzar/weekly_bazzar_tile.dart';
import 'package:vendo/screens/Write_complaints_screen/complaint_list_tile.dart';
import 'package:vendo/services/dio_client.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

import '../../routes.dart';

class MyBazzars extends ConsumerStatefulWidget {
  const MyBazzars({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyBazzars();
}

class _MyBazzars extends ConsumerState<MyBazzars> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(apiserviceProvider).getuserData(context, ref);
    final vendorDetails = ref.watch(vendordetailsProvider);
    log(vendorDetails.weeklyBazzarList.toString());
    log("hwlads ${vendorDetails.weeklyBazzarList[0]["bazzarName"]}");
    return Scaffold(
      appBar: AppBar(
        title: AppText.headingThree("My Bazaars"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: const [
            //       Image(
            //         image: AssetImage("assets/images/map.png"),
            //         width: 80,
            //         fit: BoxFit.fitHeight,
            //       ),
            //       SizedBox(width: 50),
            //     ],
            //   ),
            // ),
            Container(
              decoration: const BoxDecoration(color: Colors.pink),
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("assets/images/map.png"),
                          width: 70,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "These are the Bazaars that you applied for",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AppText.headingTwo("Status List"),
                ],
              ),
            ),
            RefreshIndicator(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vendorDetails.weeklyBazzarList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: MyBazzarListTile(
                        name: vendorDetails.weeklyBazzarList[index]
                            ["bazzarName"],
                        id: vendorDetails.weeklyBazzarList[index]["bazzarId"],
                        status: vendorDetails.weeklyBazzarList[index]["status"],
                      ),
                    );
                  }),
                ),
              ),
              onRefresh: () async {
                await ref.watch(apiserviceProvider).getuserData(context, ref);
              },
            ),
          ],
        ),
      ),
    );
  }
}
