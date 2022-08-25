import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/providers/weekly_bazzar_provider.dart';
import 'package:vendo/screens/WeeklyBazzar/DisplayCard.dart';
import 'package:vendo/screens/Write_complaints_screen/complaint_list_tile.dart';
import 'package:vendo/services/dio_client.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

import '../../routes.dart';

class ComplaintsList extends ConsumerStatefulWidget {
  const ComplaintsList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ComplaintsListState();
}

class _ComplaintsListState extends ConsumerState<ComplaintsList> {
  @override
  Widget build(BuildContext context) {
    final vendorDetails = ref.watch(vendordetailsProvider);
    return Scaffold(
      appBar: AppBar(
        title: AppText.headingThree("My Complaints"),
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
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.pink),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      //Expanded(child: Container()),
                      Image(
                        image: AssetImage("assets/images/community.png"),
                        width: 80,
                        fit: BoxFit.fitHeight,
                      ),
                      //const SizedBox(width: 50),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Opportunities are where the complaints are",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                AppText.headingTwo("Recent complaints"),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vendorDetails.complaintsList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ComplaintListTile(
                        model: vendorDetails.complaintsList[index],
                      ),
                    );
                  }),
                ),
              ),
              onRefresh: () async {
                final api = ref.watch(apiserviceProvider);
                api.getuserData(context, ref);
              },
            ),
          ),
        ],
      ),
    );
  }
}
