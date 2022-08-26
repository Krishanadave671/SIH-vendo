import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorDetailsModel/vendor_details.dart';
import 'package:vendo/models/vendorReviewModel/vendor_review_model.dart';
import 'package:vendo/providers/vendor_review_provider.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/vendor_card.dart';
import 'package:vendo/services/dio_client.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class MyReviews extends ConsumerStatefulWidget {
  const MyReviews({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyReviews();
}

class _MyReviews extends ConsumerState<MyReviews> {
  @override
  Widget build(BuildContext context) {
    final myfeedback = ref.watch(vendorFeedbackProvider);

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
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 10),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Image(
                        image: AssetImage("assets/images/testimonials.png"),
                        width: 70,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Your Feedbacks help us improve our app!!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
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
            AppText.headingThree("My Feedbacks"),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            verticalSpaceMedium,

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.refresh(feedbackProvider);
                },
                child: Expanded(
                  child: myfeedback.when(
                    data: (data) {
                      List<VendorReviewModel?> vendinReviewList =
                          data.map((e) => e).toList();
                      log(vendinReviewList.toList().toString());
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: vendinReviewList.length,
                          itemBuilder: ((context, index) {
                            return VendorCard(
                                location:
                                    vendinReviewList[index]!.shortDescription,
                                name: vendinReviewList[index]!.bmcOfficerId);
                          }));
                    },
                    error: (e, t) {
                      log(e.toString());

                      return Center(child: CircularProgressIndicator());
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
