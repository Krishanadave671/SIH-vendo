import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../routes.dart';

class DocumentaryEvidence extends StatefulWidget {
  const DocumentaryEvidence({Key? key}) : super(key: key);

  @override
  State<DocumentaryEvidence> createState() => _DocumentaryEvidence();
}

class _DocumentaryEvidence extends State<DocumentaryEvidence> {

  
// Future getPdfAndUpload()async{
//   var rng = Random();
//   String randomName="";
//   for (var i = 0; i < 20; i++) {
//     print(rng.nextInt(100));
//     randomName += rng.nextInt(100).toString();
//   }
//   File file = await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
//   String fileName = '${randomName}.pdf';
//   print(fileName);
//   print('${file.readAsBytesSync()}');
//   savePdf(file.readAsBytesSync(), fileName);
// }

// Future savePdf(List<int> asset, String name) async {

//   StorageReference reference = FirebaseStorage.instance.ref().child(name);
//   StorageUploadTask uploadTask = reference.putData(asset);
//   String url = await (await uploadTask.onComplete).ref.getDownloadURL();
//   print(url);
//   documentFileUpload(url);
//   return  url;
// }
// void documentFileUpload(String str) {

//   var data = {
//     "PDF": str,
//   };
//   mainReference.child("Documents").child('pdf').set(data).then((v) {
//   });
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: 20,
            left: 0,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppText.headingOne("Register"),
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50,
                width: 300,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      bottomEnd: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText.headingTwo(
                      "Documentary Evidence",
                      color: colors.backgroundColor,
                    ),
                  ),
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.bodyBold("Upload Documents all in pdf format"),
                    verticalSpaceLarge,
                    Row(
                      children: [
                        AppText.body("1.Pan Card"),
                        horizontalSpaceLarge,
                        GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.file_upload_outlined)),
                      ],
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        AppText.body("2.Aadhar Card"),
                        horizontalSpaceLarge,
                        GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.file_upload_outlined)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.documentaryEvidence);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 60, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 70,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: colors.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum BasicOptions {
  yes,
  no,
}
