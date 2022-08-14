import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vendo/screens/write_Complaints_screen/complaints.dart';
import 'package:vendo/util/colors.dart';

import '../../../util/AppFonts/app_text.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.headingOne("Display the Picture"),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        children: [
          Image.file(
            File(imagePath),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop(imagePath);
              },
              child: Icon(
                Icons.save,
                size: MediaQuery.of(context).size.width * 0.2,
                color: colors.primary,
              )),
        ],
      ),
    );
  }
}
