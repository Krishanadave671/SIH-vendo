import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vendo/Screens/Homescreen/screens/home_screen.dart';
import 'package:vendo/Screens/Resources_page/resources_page.dart';
import 'package:vendo/Screens/calendar_screen/calendar.dart';
import 'package:vendo/Screens/write_Complaints_screen/complaints.dart';
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
    HomeScreen(),
    AddComplaints(),
    Calendar(title: 'Krishana'),
    ResourcesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentindex,
          selectedItemColor: colors.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Complaints', icon: Icon(Icons.edit_note)),
            BottomNavigationBarItem(
                label: 'weekly bazaar ', icon: Icon(Icons.calendar_month)),
            BottomNavigationBarItem(
                label: 'Resources', icon: Icon(Icons.cast_for_education))
          ]),
    );
  }
}
