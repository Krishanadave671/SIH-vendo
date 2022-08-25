import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/vendor_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

import '../../../models/vendor_visit_list/vendor_visit_list.dart';

class BMCHomePage extends StatefulWidget {
  const BMCHomePage({Key? key}) : super(key: key);

  @override
  State<BMCHomePage> createState() => _BMCHomePageState();
}

class _BMCHomePageState extends State<BMCHomePage> {
  List<VendorListModel> vendorList = [
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(70))),
                ),
                Container()
              ],
            ),
            // verticalSpaceSmall,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       AppText.headingOne("Feedback Page"),
            //     ],
            //   ),
            // ),
            // verticalSpaceSmall,
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.pink,
            //   ),
            //   child: ,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 0, right: 10),
            //   child: Container(
            //     //height: 400,
            //     decoration: const BoxDecoration(
            //         color: Colors.amber,
            //         borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(20),
            //             bottomRight: Radius.circular(20))),
            //     child: Row(
            //       children: [
            //         const Image(
            //           image: NetworkImage(
            //               "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Max_Verstappen_2017_Malaysia_3.jpg/640px-Max_Verstappen_2017_Malaysia_3.jpg"),
            //           fit: BoxFit.fitWidth,
            //           height: 150,
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.person,
            //                       color: Colors.red,
            //                     ),
            //                     AppText.bodyBold("Name: "),
            //                     Expanded(child: AppText.body("Max Verstappen")),
            //                   ],
            //                 ),
            //                 verticalSpaceTiny,
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.card_membership,
            //                       color: Colors.purple,
            //                     ),
            //                     AppText.bodyBold("ID: "),
            //                     AppText.body("231461098"),
            //                   ],
            //                 ),
            //                 verticalSpaceTiny,
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.phone,
            //                       color: Colors.green,
            //                     ),
            //                     AppText.bodyBold("Contact: "),
            //                     AppText.body("9314610982"),
            //                   ],
            //                 ),
            //                 verticalSpaceTiny,
            //                 Row(
            //                   children: [
            //                     const Icon(Icons.email,
            //                         color: Colors.deepOrangeAccent),
            //                     AppText.bodyBold("Email: "),
            //                     Expanded(
            //                         child:
            //                             AppText.body("driftmaster@gmail.com"))
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            verticalSpaceMedium,
            AppText.headingThree("Places to check"),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vendorList.length,
                  itemBuilder: ((context, index) {
                    return VendorCard(
                        location: vendorList[index].location,
                        name: vendorList[index].vendorName);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
