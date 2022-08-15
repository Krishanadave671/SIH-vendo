import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vendo/Screens/Homescreen/screens/widgets/services_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'widgets/myCard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1525382455947-f319bc05fb35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1576222901803-c062b57925b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWFsc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1604429868519-8a64cb3b010b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YW5pbWFsc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1573751056139-2ab65b6b03be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YW5pbWFsc3xlbnwwfDJ8MHx8&auto=format&fit=crop&w=500&q=60'
  ];

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
              MyCard(
                vendorImageurl:
                    "https://avatars.githubusercontent.com/u/84977709?s=400&u=6061e991de17cb0ba45b5713ee1eceb8d7a16ea4&v=4",
                vendorName: "Krishana Dave",
                vendorId: "VX1234567",
                vendorshopName: "Kirti Vadapav Center",
                expiryDate: "05/27",
                phoneNumber: "8104875867",
                category: Icons.clean_hands,
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
                  verticalSpaceMedium,
                  CarouselSlider(
                    items: imgList
                        .map(
                          (item) => Container(
                              child: GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                      width: 1000,
                                    ),
                                  ),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, '/details_page2');
                                  })),
                        )
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
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
    );
  }
}
