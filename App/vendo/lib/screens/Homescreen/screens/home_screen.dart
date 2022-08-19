import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendo/Screens/Homescreen/screens/widgets/services_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import '../../../routes.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://i1.wp.com/www.forwardpress.in/wp-content/uploads/2018/02/narega-1.jpg?resize=745%2C398&ssl=1',
    'https://sarkariyojanas.com/wp-content/uploads/2019/11/Samagra-Shiksha-Abhiyan.jpg',
    'https://theindianfreepress.com/wp-content/uploads/2020/09/Poshan-Abhiyan-e1599499040576.jpeg',
    'https://th.bing.com/th/id/R.861ac8a40b36204c15e1e4facc795ea6?rik=WArgFFKNNq9DlA&riu=http%3a%2f%2fwww.bhubaneswarbuzz.com%2fwp-content%2fuploads%2f2015%2f11%2fAMRUT-Logo.png&ehk=bwOvyjWP8TiHEbQlrkvoCtDLD4O7Zu2xrLJzMy9O5zY%3d&risl=&pid=ImgRaw&r=0',
  ];

  final String uniqueString = "*7%";
  String? vendorImageURL =
      "https://avatars.githubusercontent.com/u/84977709?s=400&u=6061e991de17cb0ba45b5713ee1eceb8d7a16ea4&v=4";
  String? vendorName = "Krishana Dave";
  String? vendorID = "VX1234567";
  String? vendorShopName = "Kirti Vadapav Center";
  String? expiryDate = "05/27";
  String? vendorPhoneNo = "8104875867";
  LatLng? vendorLocation = const LatLng(23, 100);
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
    // ignore: avoid_print
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
            GestureDetector(
              child: const Icon(
                Icons.notifications,
                color: colors.primary,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.notificationScreen),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                color: const Color.fromARGB(255, 232, 231, 231),
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
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(vendorImageURL!),
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
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child:
                                    AppText.body1("Expiry date : $expiryDate"),
                              ),
                              const SizedBox(
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
                                        children: const [
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

                                    const SizedBox(
                                      width: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _makingPhoneCall();
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.call,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            vendorPhoneNo!,
                                            style: const TextStyle(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 80,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        qrPressed();
                                      },
                                      child: const Icon(
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
                      const SizedBox(
                        height: 10,
                      ),
                      AppText.headingThree("Services"),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          const SizedBox(
                            height: 20,
                          ),
                          AppText.headingThree("Goverment Schemes"),
                          //carousel slider
                          CarouselSlider(
                            items: imgList
                                .map(
                                  (item) => GestureDetector(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                    ),
                                    onTap: () => Navigator.of(context)
                                    .pushNamed(Routes.schemeDetails),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                            ),
                          ),
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
                      decoration: const BoxDecoration(color: Colors.transparent),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: Center(
                        child: QrImage(
                          data:
                              "SN:$vendorShopName \nVL: \nED:$expiryDate \nPN:$vendorPhoneNo \n$uniqueString",
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
      ),
    );
  }
}
