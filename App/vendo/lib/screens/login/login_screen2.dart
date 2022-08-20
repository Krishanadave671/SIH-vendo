// import 'package:flutter/material.dart';
// import 'package:vendo/util/AppFonts/app_text.dart';
// import 'package:vendo/util/colors.dart';

// class LoginScreen1 extends StatefulWidget {
//   LoginScreen1({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen1> createState() => _LoginScreen1State();
// }

// class _LoginScreen1State extends State<LoginScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           // height: MediaQuery.of(context).size.height * 0.35,
//           width: double.infinity,
//           constraints: BoxConstraints(
//               maxHeight: MediaQuery.of(context).size.height,
//               maxWidth: MediaQuery.of(context).size.width),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.orange.shade800, Colors.orange.shade600],
//                 begin: Alignment.topLeft,
//                 end: Alignment.centerRight),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 36.0, horizontal: 24.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 46.0,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text(
//                           "Welcome street Vendors !!",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               Expanded(
//                   flex: 5,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           topRight: Radius.circular(40),
//                         )),
//                     child: Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 100,
//                           ),
//                           TextField(
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 fillColor: Color(0xFFe7edeb),
//                                 hintText: "Email",
//                                 prefixIcon: Icon(
//                                   Icons.email,
//                                   color: Colors.grey.shade600,
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           TextField(
//                             obscureText: true,
//                             keyboardType: TextInputType.visiblePassword,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 fillColor: Color(0xFFe7edeb),
//                                 hintText: "Password",
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.grey.shade600,
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 50,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 40,
//                             child: ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.orange.shade600,
//                                 ),
//                                 child: Text(
//                                   "Login",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16.0,
//                                   ),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               AppText.body("Are you a new Vendor ? "),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "Register",
//                                   style: TextStyle(
//                                       color: Colors.orange.shade800,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
