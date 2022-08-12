import 'package:flutter/material.dart';
import 'package:vendo/Screens/Homescreen/screens/widgets/services_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'widgets/myCard.dart';

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
