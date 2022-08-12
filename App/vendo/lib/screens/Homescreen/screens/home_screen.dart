import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 232, 231, 231),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.headingThree("Hi Krishana Dave !!"),
                  Icon(Icons.notifications),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "View more",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PhysicalModel(
                color: Colors.white,
                elevation: 8,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 6.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20.0),
                  //   color: Colors.grey.shade100,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey,
                  //       offset: Offset(0.0, 1.0), //(x,y)
                  //       blurRadius: 6.0,
                  //     ),
                  //   ],
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/84977709?s=400&u=6061e991de17cb0ba45b5713ee1eceb8d7a16ea4&v=4"),
                          ),
                        ),
                        title: AppText.headingThree("Krishana Dave "),
                        subtitle: AppText.body('Vendorid : VX1233439 '),
                        hoverColor: Colors.red,
                        trailing: Icon(
                          Icons.food_bank,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                      Center(
                          child: Text(
                        "Kirti Vadapav Center",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: AppText.body1("Expiry date : 05/27 "),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            Text(
                              "8104875867",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Icon(
                              Icons.qr_code_scanner,
                              size: 30,
                            ),
                            // contact us
                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppText.headingThree("Services"),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 100,
                            height: 75,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AppText.caption("Search Locations"),
                              ],
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppText.headingThree("Goverment Schemes"),
                  
                ],

              )
              // Gridview
              // MySchemes ,
              // pay taxes ,
              // my complaints ,
              // weather updates ,
              // ward Details ,
              // Emergency contacts  ,
              // full profile ,
              // my Complaints
            ],

            // horizontal scrollview schemes available by goverment
          ),
        ),
      ),
    );
  }
}
