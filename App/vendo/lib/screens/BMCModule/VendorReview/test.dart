// import 'package:flutter/material.dart';
// import 'package:vendo/util/AppFonts/app_text.dart';
// import 'package:vendo/util/AppInterface/ui_helpers.dart';
// import 'package:vendo/util/colors.dart';

// class VendorCheck extends StatefulWidget {
//   const VendorCheck({Key? key}) : super(key: key);

//   @override
//   State<VendorCheck> createState() => _VendorCheck();
// }

// class _VendorCheck extends State<VendorCheck> {
//   Choices? q1 = Choices.yes;

//   Choices? q2 = Choices.yes;
//   Choices? q3 = Choices.yes;
//   Choices? q4 = Choices.yes;
//   bool q5 = false;
//   bool q6 = false;
//   bool q7 = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.primary,
//       appBar: AppBar(
//         title: AppText.headingOne(
//           "Kirti Vadapav Shop",
//           color: Colors.white,
//         ),
//         elevation: 0,
//         backgroundColor: colors.primary,
//         leading: IconButton(
//             padding: const EdgeInsets.all(0),
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             }),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               left: MediaQuery.of(context).size.width * 0.1,
//               right: MediaQuery.of(context).size.width * 0.1,
//             ),
//             child: AppText.bodyBold(
//               "expiry date : 23-2-22",
//               color: Colors.white,
//             ),
//           ),
//           verticalSpaceMedium,
//           Container(
//             padding: const EdgeInsets.only(left: 20, right: 10),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   ListTile(
//                     leading: const Icon(Icons.clean_hands),
//                     title: AppText.bodyBold("Sanitaztion Checks"),
//                   ),
//                   verticalSpaceSmall,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText.body("Is the stall area water clogging free ?"),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: Row(
//                               children: [
//                                 Radio<Choices>(
//                                   value: Choices.yes,
//                                   groupValue: q1,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q1 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("yes"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.no,
//                                   groupValue: q1,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q1 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("no"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.notApplicable,
//                                   groupValue: q1,
//                                   onChanged: (Choices? value) {
//                                     setState(
//                                       () {
//                                         q1 = value;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 AppText.body("not-applicable"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   verticalSpaceSmall,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText.body("Is food covered ?"),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: Row(
//                               children: [
//                                 Radio<Choices>(
//                                   value: Choices.yes,
//                                   groupValue: q2,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q2 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("yes"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.no,
//                                   groupValue: q2,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q2 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("no"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.notApplicable,
//                                   groupValue: q2,
//                                   onChanged: (Choices? value) {
//                                     setState(
//                                       () {
//                                         q2 = value;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 AppText.body("not-applicable"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   verticalSpaceSmall,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText.body(
//                           "Is clean drinking water used for cooking ?"),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: Row(
//                               children: [
//                                 Radio<Choices>(
//                                   value: Choices.yes,
//                                   groupValue: q3,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q3 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("yes"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.no,
//                                   groupValue: q3,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q3 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("no"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.notApplicable,
//                                   groupValue: q3,
//                                   onChanged: (Choices? value) {
//                                     setState(
//                                       () {
//                                         q3 = value;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 AppText.body("not-applicable"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   verticalSpaceSmall,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText.body("Is the vendor wearing gloves ?"),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: Row(
//                               children: [
//                                 Radio<Choices>(
//                                   value: Choices.yes,
//                                   groupValue: q4,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q4 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("yes"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.no,
//                                   groupValue: q4,
//                                   onChanged: (Choices? value) {
//                                     setState(() {
//                                       q4 = value;
//                                     });
//                                   },
//                                 ),
//                                 AppText.body("no"),
//                                 const Spacer(),
//                                 Radio<Choices>(
//                                   value: Choices.notApplicable,
//                                   groupValue: q4,
//                                   onChanged: (Choices? value) {
//                                     setState(
//                                       () {
//                                         q4 = value;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 AppText.body("not-applicable"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   verticalSpaceSmall,
//                   ListTile(
//                     leading: const Icon(Icons.location_on),
//                     title: AppText.bodyBold("Location check"),
//                   ),
//                   verticalSpaceSmall,
//                   Row(
//                     children: <Widget>[
//                       AppText.body("Is the stall in the approved location ?"),
//                       const Spacer(),
//                       Checkbox(
//                         value: q5,
//                         onChanged: (value) {
//                           setState(
//                             () {
//                               q5 = value!;
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   verticalSpaceSmall,
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                           flex: 5,
//                           child: AppText.body(
//                               "Is the foot traffic well managed ?")),
//                       const Spacer(),
//                       Checkbox(
//                         value: q6,
//                         onChanged: (value) {
//                           setState(
//                             () {
//                               q6 = value!;
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   verticalSpaceMedium,
//                   ListTile(
//                     leading: const Icon(Icons.child_care),
//                     title: AppText.bodyBold("Malpractices check"),
//                   ),
//                   verticalSpaceSmall,
//                   Row(
//                     children: <Widget>[
//                       AppText.body("Is the working staff over 14 ?"),
//                       const Spacer(),
//                       Checkbox(
//                         value: q7,
//                         onChanged: (value) {
//                           setState(
//                             () {
//                               q7 = value!;
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   verticalSpaceLarge,
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// enum Choices {
//   yes,
//   no,
//   notApplicable,
// }
