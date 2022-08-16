import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:place_picker/entities/location_result.dart';
// import 'package:place_picker/widgets/place_picker.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/screens/write_Complaints_screen/take_picture.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../util/AppFonts/styles.dart';

class AddComplaints extends StatefulWidget {
  AddComplaints({Key? key}) : super(key: key);

  @override
  State<AddComplaints> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends State<AddComplaints> {
  String? displayImagePath;
  String? _complaintType;
  String _location = '';
  bool isInitialized = false;
  XFile? image;
  String? _description;
  late final String uniqueString;
  late final String imagePathString;
  late final imageRef;
  late final CameraController cameraController;
  late CameraDescription cameraDescription;

  // void showPlacePicker() async {
  //   LocationResult result = await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           PlacePicker("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"),
  //     ),
  //   );
  //   print(result.city.name.toString());
  //   setState(() {
  //     //get whatever data about gmaps you want here
  //     _location = result.city.name.toString();
  //   });
  // }

  Future<void> cameraSettings() async {
    late final CameraController _cameraController;
    final _cameras = await availableCameras();

    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      setState(() {
        cameraController = _cameraController;
        isInitialized = true;
        cameraDescription = _cameras[0];
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  Future<void> takePhoto() async {
    final _displayImagePath = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(
          camera: cameraDescription,
        ),
      ),
    );
    setState(
      () {
        displayImagePath = _displayImagePath;
        print(" hi $displayImagePath");
      },
    );
  }

  void onContinue() {
    //make api call here
    print(" $_location , $_complaintType , $_description , $imagePathString ");
  }

  Future<void> uploadPhoto() async {
    try {
      final storage = FirebaseStorage.instance;
      imageRef = storage.ref().child(imagePathString);
      await imageRef.putFile(File(displayImagePath!), SettableMetadata(contentType: "jpeg"));
    } catch (e) {
      print(e);
    }
  }



  @override
  void initState() {
    uniqueString = 'yash';
    imagePathString = 'vendor_complaints/$uniqueString/photo.jpeg';
    cameraSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 231, 231),
      appBar: AppBar(
        title: AppText.headingTwo("Vendor Complaints"),
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
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.body("Locality"),
                          TextField(
                            onChanged: (value) => value,
                            readOnly: true,
                            onTap: () {
                              // showPlacePicker();
                            },
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.kcCaptionGreyColor),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.kcCaptionGreyColor),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.kcCaptionGreyColor),
                              ),
                              hintText: _location,
                              hintStyle: body1Style,
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: colors.kcCaptionGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.body("Complaint Type"),
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButton<String>(
                              value: _complaintType,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(
                                color: colors.kcPrimaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _complaintType = newValue!;
                                });
                              },
                              items: <String>[
                                'Sanitation',
                                'Harrasement',
                                'Water Clogging',
                                'Garbage Disposal'
                              ].map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.body("Write short description"),
                          TextField(
                            onChanged: ((value) {
                              _description = value;
                            }),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: (displayImagePath != null)
                                ? Image.file(File(displayImagePath!))
                                : Image.asset("assets/images/user.png"),
                          ),
                          verticalSpaceSmall,
                          GestureDetector(
                            onTap: () {
                              takePhoto();
                            },
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.camera,
                                  size: MediaQuery.of(context).size.width * 0.2,
                                  color: colors.primary,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  GestureDetector(
                    onTap: () async{
                      await uploadPhoto();
                      onContinue();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Complaint Registered"),
                      ));
                      Navigator.of(context).pushNamed(Routes.mainPage);
                    },
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: AppText.body("Raise issue"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
