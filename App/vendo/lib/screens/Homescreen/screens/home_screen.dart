import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.headingThree("Hi Krishana Dave !!"),
                  Icon(Icons.notifications),
                  // notifications icon
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/84977709?s=400&u=6061e991de17cb0ba45b5713ee1eceb8d7a16ea4&v=4"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
