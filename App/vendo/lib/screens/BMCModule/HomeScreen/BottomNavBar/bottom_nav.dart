import 'dart:io';

import 'package:flutter/material.dart';

import 'package:vendo/Screens/write_Complaints_screen/complaints.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/home_page.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/qr_scanner.dart';
import 'package:vendo/util/colors.dart';

class BMCBottomNav extends StatefulWidget {
  const BMCBottomNav({Key? key}) : super(key: key);

  @override
  State<BMCBottomNav> createState() => _BMCBottomNav();
}

class _BMCBottomNav extends State<BMCBottomNav> {
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  List pages = [
    BMCHomePage(),
    ScanQR(),
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
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Complaints', icon: Icon(Icons.qr_code_scanner_sharp)),
          ]),
    );
  }
}
