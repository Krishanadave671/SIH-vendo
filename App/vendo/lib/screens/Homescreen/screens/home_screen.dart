import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/place_picker.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendo/Screens/Homescreen/screens/widgets/services_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import 'widgets/myCard.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? vendorImageURL =
      "https://avatars.githubusercontent.com/u/84977709?s=400&u=6061e991de17cb0ba45b5713ee1eceb8d7a16ea4&v=4";
  String? vendorName = "Krishana Dave";
  String? vendorID = "VX1234567";
  String? vendorShopName = "Kirti Vadapav Center";
  String? expiryDate = "05/27";
  String? vendorPhoneNo = "8104875867";
  LatLng? vendorLocation = LatLng(23, 100);
  IconData iconData = Icons.clean_hands;
  bool isQRVisible = false;

  void qrPressed() {
    setState(() {
      isQRVisible = !isQRVisible;
    });
  }

  void _makingPhoneCall() async {
    var url = Uri.parse("tel:$vendorPhoneNo");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              "AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw",
              displayLocation: vendorLocation,
            )));

    // Handle the result in your way
    print(result.latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            AppText.headingThree("Hi Krishana Dave !!"),
            horizontalSpaceLarge,
            Icon(
              Icons.notifications,
              color: colors.primary,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: Color.fromARGB(255, 232, 231, 231),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 210,
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Container(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(vendorImageURL!),
                                ),
                              ),
                              title: AppText.headingThree(vendorName!),
                              subtitle: AppText.body('Vendorid : $vendorID'),
                              hoverColor: Colors.red,
                              trailing: Icon(
                                iconData,
                                size: 40,
                                color: Colors.green,
                              ),
                            ),
                            Center(
                                child: Text(
                              vendorShopName!,
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
                              child: AppText.body1("Expiry date : $expiryDate"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showPlacePicker();
                                    },
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
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _makingPhoneCall();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          vendorPhoneNo!,
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 80,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      qrPressed();
                                    },
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      size: 30,
                                    ),
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
                            Servicescard(
                              icon: Icons.document_scanner_sharp,
                              serviceName: "My Schemes",
                              color: Colors.red,
                            ),
                            Servicescard(
                                color: Colors.green,
                                icon: Icons.health_and_safety,
                                serviceName: "Health and safety"),
                            Servicescard(
                                color: Colors.blue,
                                icon: Icons.search,
                                serviceName: "Search Locations"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Servicescard(
                              icon: Icons.location_city,
                              serviceName: "New shops",
                              color: Colors.yellow,
                            ),
                            Servicescard(
                              color: Colors.lightGreen,
                              icon: Icons.phone_in_talk,
                              serviceName: "Contact TVC's",
                            ),
                            Servicescard(
                                color: Colors.lightBlue,
                                icon: Icons.map_sharp,
                                serviceName: "Vending Maps"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Servicescard(
                              color: Colors.purple,
                              icon: Icons.online_prediction_rounded,
                              serviceName: "Take Permissions",
                            ),
                            Servicescard(
                                color: Colors.teal,
                                icon: Icons.shop,
                                serviceName: "License renewal"),
                            Servicescard(
                              color: Colors.green,
                              icon: Icons.money,
                              serviceName: "Loan Facilities",
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
          ),
          Visibility(
            visible: isQRVisible,
            child: GestureDetector(
              onTap: () {
                qrPressed();
              },
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.95,
                    child: Center(
                      child: QrImage(
                        data:
                            "Shop name : $vendorShopName \nVendor location : $vendorLocation \nExpiry : $expiryDate \nPhone number : $vendorPhoneNo",
                        version: QrVersions.auto,
                        size: 300.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
