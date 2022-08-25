import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:place_picker/place_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendo/models/governmentSchemeModel/government_scheme_model.dart';
import 'package:vendo/models/vendorDetailsModel/vendor_details.dart';

import 'package:vendo/providers/government_scheme_provider.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

import 'package:vendo/services/dio_client.dart';

import 'package:vendo/screens/Homescreen/screens/widgets/services_card.dart';

import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import '../../../routes.dart';
import 'dart:ui' as ui;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String uniqueString = "*7%";

  String? expiryDate = "05/27";

  IconData iconData = Icons.person;
  bool isQRVisible = false;

  void qrPressed() {
    // ref.watch(apiserviceProvider).getuserData(context, ref);
    setState(() {
      isQRVisible = !isQRVisible;
    });
  }

  void _makingPhoneCall(vendorDetails) async {
    var url = Uri.parse("tel:${vendorDetails.phone}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showPlacePicker(vendorDetails) async {
    LatLng latLng =
        LatLng(vendorDetails.shopLocationLat, vendorDetails.shopLocationLong);
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              "AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw",
              displayLocation: latLng,
            )));

    print(result.latLng);
  }

  @override
  Widget build(BuildContext context) {
    log('message');
    final governmentSchemesData = ref.watch(governmentSchemeProvider);
    final vendorDetails = ref.watch(vendordetailsProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.headingThree("Hi ${vendorDetails.name} !!"),
            const Spacer(),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    color: const Color.fromARGB(255, 232, 231, 231),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
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
                                      backgroundImage: NetworkImage(
                                          vendorDetails.vendorImageurl),
                                    ),
                                    title: AppText.headingThree(
                                        vendorDetails.name),
                                    subtitle: AppText.body(
                                        'Vendorid : ${vendorDetails.vendorId}'),
                                    hoverColor: Colors.red,
                                    trailing: Icon(
                                      iconData,
                                      size: 40,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                    vendorDetails.shopName,
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
                                    child: AppText.body1(
                                        "License expiry date : $expiryDate"),
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
                                            showPlacePicker(vendorDetails);
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
                                            _makingPhoneCall(vendorDetails);
                                          },
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.call,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                vendorDetails.phone,
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Servicescard(
                                    icon: Icons.price_change,
                                    serviceName: "My Incentives",
                                    color: Colors.green,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          Routes.availableIncentives);
                                    },
                                  ),
                                  Servicescard(
                                    color: Colors.red,
                                    icon: Icons.app_registration_outlined,
                                    serviceName: "My Complaints",
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.complaintsList);
                                    },
                                  ),
                                  Servicescard(
                                    color: Colors.blue,
                                    icon: Icons.calendar_month,
                                    serviceName: "My Bazzars",
                                    onTap: () async {},
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Servicescard(
                                    icon: Icons.score_rounded,
                                    serviceName: "My Credit Score",
                                    color: Colors.yellow,
                                    onTap: () {},
                                  ),
                                  Servicescard(
                                    color: Colors.lightGreen,
                                    icon: Icons.reviews,
                                    serviceName: "My Reviews",
                                    onTap: () {},
                                  ),
                                  Servicescard(
                                    color: Colors.black,
                                    icon: Icons.qr_code_scanner,
                                    serviceName: "My QR",
                                    onTap: () {
                                      qrPressed();
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              AppText.headingThree("Goverment Schemes"),
                              verticalSpaceLarge,
                              //carousel slider

                              governmentSchemesData.when(
                                data: (data) {
                                  List<GovernmentSchemeModel?>
                                      governmentSchemeList =
                                      data.map((e) => e).toList();

                                  return CarouselSlider(
                                    items: governmentSchemeList
                                        .map(
                                          (item) => GestureDetector(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                item!.schemeImageUrl,
                                                fit: BoxFit.cover,
                                                width: 1000,
                                              ),
                                            ),
                                            onTap: () => Navigator.of(context)
                                                .pushNamed(Routes.schemeDetails,
                                                    arguments: SchemeArguments(
                                                        model: item)),
                                          ),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                    ),
                                  );
                                },
                                error: (e, t) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () => Center(
                                  //child: CircularProgressIndicator(),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Text(
                                        "Apply for Government Schemes here"),
                                  ),
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
                          decoration: const BoxDecoration(color: Colors.black),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.95,
                          child: Center(
                            child: QrImage(
                              data: "hii yassh",
                              // "SN:${vendorDetails.shopName} \nVL:${LatLng(vendorDetails.shopLocationLat, vendorDetails.shopLocationLong)} \nED:$expiryDate \nPN:${vendorDetails.phone} \n$uniqueString",
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
        ],
      ),
    );
  }
}
