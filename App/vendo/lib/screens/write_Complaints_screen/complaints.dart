import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorDetailsModel/vendor_details.dart';

import 'package:vendo/providers/vendor_complaints_provider.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/screens/write_Complaints_screen/take_picture.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../services/dio_client.dart';
import '../../util/AppFonts/styles.dart';

class AddComplaints extends ConsumerStatefulWidget {
  AddComplaints({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends ConsumerState<AddComplaints> {
  String? displayImagePath;
  String? _complaintType;
  VendorModel? vendorDetails;
  bool isInitialized = false;
  XFile? image;
  String? description;
  late final String uniqueString;
  late final String imagePathString;
  late Reference imageRef;
  late final CameraController cameraController;
  late CameraDescription cameraDescription;

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

  void onContinue() async {
    var imageUrl = await imageRef.getDownloadURL();
    final complaintDetails = ref.watch(vendorComplaintProvider);
    complaintDetails.complaintLocationLat = vendorDetails!.shopLocationLat;
    complaintDetails.complaintLocationLong = vendorDetails!.shopLocationLong;

    complaintDetails.complaintDescription = description!;
    complaintDetails.complaintImageUrl = imageUrl;
    complaintDetails.complaintDate = DateTime.now().toString();
    log(complaintDetails.complaintDate);
    complaintDetails.complaintType.add(_complaintType!);

    try {
      //api to register the complaint
      final _api = ref.watch(apiserviceProvider);
      var response = await _api.addComplaint(complaintDetails, context, ref);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadPhoto() async {
    try {
      final storage = FirebaseStorage.instance;
      imageRef = storage.ref().child(imagePathString);
      await imageRef.putFile(
          File(displayImagePath!), SettableMetadata(contentType: "jpeg"));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    vendorDetails = ref.read(vendordetailsProvider);
    uniqueString = vendorDetails!.vendorId;
    imagePathString = 'vendor_complaints/$uniqueString/photo.jpeg';
    cameraSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vendorDetails = ref.watch(vendordetailsProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 231, 231),
      appBar: AppBar(
        title: AppText.headingThree("Vendor Complaints"),
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
          margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.bodyBold("Complaint Type"),
                          SizedBox(
                            // width: double.infinity,
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
                                'other',
                                'harrasement',
                                'waterClogging',
                                'garbageDisposal'
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
                          verticalSpaceMedium,
                          AppText.bodyBold("Write short description"),
                          TextField(
                            onChanged: ((value) {
                              description = value;
                            }),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                          verticalSpaceLarge,
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: (displayImagePath != null)
                                  ? Image.file(File(displayImagePath!))
                                  : Image.asset("assets/images/takeaphoto.png"),
                            ),
                          ),
                          verticalSpaceMedium,
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                takePhoto();
                              },
                              child: SizedBox(
                                //height: 100,
                                width: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  // child: Icon(
                                  //   Icons.camera_alt,
                                  //   size:
                                  //       MediaQuery.of(context).size.width * 0.2,
                                  //   color: colors.primary,
                                  // ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                          AppText.containerText("Take photo")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                  ElevatedButton(
                      onPressed: () async {
                        await uploadPhoto();
                        onContinue();
                        Navigator.of(context).pushNamed(Routes.mainPage);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: const Text(
                        "Raise issue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
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
