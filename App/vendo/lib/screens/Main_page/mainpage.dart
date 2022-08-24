import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vendo/Screens/Homescreen/screens/home_screen.dart';

import 'package:vendo/Screens/write_Complaints_screen/complaints.dart';
import 'package:vendo/screens/incentive_detail/incentive_detail.dart';
import 'package:vendo/screens/incentive_lists/incentive_list.dart';
import 'package:vendo/screens/WeeklyBazzar/weekly_bazzar.dart';
import 'package:vendo/util/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  List pages = [
    const HomeScreen(),
    AddComplaints(),
    const Calendar(title: 'Krishana'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentindex],

      // body: SingleChildScrollView(
      //   child: ListView(
      //     scrollDirection: Axis.vertical,
      //     controller: controller,
      //     children: <Widget>[
      //       pages[currentindex],
      //     ],
      //   ),
      // ),
      // body: Column(
      //   controller: controller,
      //   children: [pages[currentindex],],
      // ),

      //wrap with ScrollToHideWidget
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentindex,
          selectedItemColor: colors.orangedarkshade,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Complaints', icon: Icon(Icons.edit_note)),
            BottomNavigationBarItem(
                label: 'weekly bazaar ', icon: Icon(Icons.calendar_month)),
          ]),
    );
  }
}
