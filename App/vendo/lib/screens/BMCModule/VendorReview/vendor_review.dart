import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorReviewModel/vendor_review_model.dart';
import 'package:vendo/providers/vendor_review_provider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/colors.dart';
import '../../../services/dio_client.dart';
import '../../../util/AppInterface/ui_helpers.dart';
import '../../Write_complaints_screen/take_picture.dart';

class VendorCheck extends ConsumerStatefulWidget {
  const VendorCheck({
    Key? key,
    required this.shopName,
    required this.expiry,
    required this.vendorLocation,
    required this.phoneNo,
    required this.id,
  }) : super(key: key);
  final String shopName;
  final String vendorLocation;
  final String expiry;
  final String phoneNo;
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VendorCheckState();
}

class _VendorCheckState extends ConsumerState<VendorCheck> {
  Choices? q1 = Choices.yes;

  Choices? q2 = Choices.yes;
  Choices? q3 = Choices.yes;
  Choices? q4 = Choices.yes;
  bool q5 = false;
  bool q6 = false;
  bool q7 = false;
  String description = '';
  late final String uniqueString;
  late final String imagePathString;
  late final Reference imageRef;
  late final CameraController cameraController;
  late CameraDescription cameraDescription;
  bool isInitialized = false;
  XFile? image;
  String? displayImagePath;
  late VendorReviewModel vendorReview;
  late String imageUrl;

  Future<void> onContinue() async {
    await uploadPhoto();
    vendorReview.bmcOfficerId = "yash";
    vendorReview.waterClogging = q1.toString().substring(8);
    vendorReview.foodCover = q2.toString().substring(8);
    vendorReview.cleanDrinkingWater = q3.toString().substring(8);
    vendorReview.vendorWearingGloves = q4.toString().substring(8);
    vendorReview.isApprovedLocation = q5;
    vendorReview.isFootTraffic = q6;
    vendorReview.isLegalAge = q7;
    vendorReview.shortDescription = description;
    vendorReview.reviewImageUrl = imageUrl;
    double creditScore = 0;
    if (q1 == Choices.yes) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q2 == Choices.yes) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q3 == Choices.yes) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q4 == Choices.yes) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q5 == true) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q6 == true) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    if (q7 == true) {
      creditScore++;
    } else if (q1 == Choices.no) {
      creditScore--;
    }

    vendorReview.creditScoreAbsolute = creditScore;
    log(vendorReview.toJson().toString());
    //implement api here to put the review

    try {
      //api to submit the review
      final _api = ref.watch(apiserviceProvider);
      vendorReview.vendorId = widget.id;
      var response = await _api.addReview(vendorReview, context);
      ref.watch(feedbackProvider.notifier).addReview(vendorReview);
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
      imageUrl = await imageRef.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

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

  @override
  void initState() {
    uniqueString = 'yash';
    imagePathString = 'bmc_reviews/$uniqueString/photo.jpeg';
    cameraSettings();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    vendorReview = ref.watch(vendorReviewProvider);
    return Scaffold(
      backgroundColor: colors.primary,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.headingOne(
                  "${widget.shopName}",
                  color: Colors.white,
                ),
                AppText.bodyBold(
                  "expiry date : ${widget.expiry}",
                  color: Colors.white,
                ),
              ],
            ),
          ),
          verticalSpaceMedium,
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.clean_hands),
                    title: AppText.bodyBold("Sanitaztion Checks"),
                  ),
                  verticalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.body("Is the stall area water clogging free ?"),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Radio<Choices>(
                                  value: Choices.yes,
                                  groupValue: q1,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q1 = value;
                                    });
                                  },
                                ),
                                AppText.body("yes"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.no,
                                  groupValue: q1,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q1 = value;
                                    });
                                  },
                                ),
                                AppText.body("no"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.notApplicable,
                                  groupValue: q1,
                                  onChanged: (Choices? value) {
                                    setState(
                                      () {
                                        q1 = value;
                                      },
                                    );
                                  },
                                ),
                                AppText.body("not-applicable"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.body("Is food covered ?"),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Radio<Choices>(
                                  value: Choices.yes,
                                  groupValue: q2,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q2 = value;
                                    });
                                  },
                                ),
                                AppText.body("yes"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.no,
                                  groupValue: q2,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q2 = value;
                                    });
                                  },
                                ),
                                AppText.body("no"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.notApplicable,
                                  groupValue: q2,
                                  onChanged: (Choices? value) {
                                    setState(
                                      () {
                                        q2 = value;
                                      },
                                    );
                                  },
                                ),
                                AppText.body("not-applicable"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.body(
                          "Is clean drinking water used for cooking ?"),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Radio<Choices>(
                                  value: Choices.yes,
                                  groupValue: q3,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q3 = value;
                                    });
                                  },
                                ),
                                AppText.body("yes"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.no,
                                  groupValue: q3,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q3 = value;
                                    });
                                  },
                                ),
                                AppText.body("no"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.notApplicable,
                                  groupValue: q3,
                                  onChanged: (Choices? value) {
                                    setState(
                                      () {
                                        q3 = value;
                                      },
                                    );
                                  },
                                ),
                                AppText.body("not-applicable"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.body("Is the vendor wearing gloves ?"),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Radio<Choices>(
                                  value: Choices.yes,
                                  groupValue: q4,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q4 = value;
                                    });
                                  },
                                ),
                                AppText.body("yes"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.no,
                                  groupValue: q4,
                                  onChanged: (Choices? value) {
                                    setState(() {
                                      q4 = value;
                                    });
                                  },
                                ),
                                AppText.body("no"),
                                const Spacer(),
                                Radio<Choices>(
                                  value: Choices.notApplicable,
                                  groupValue: q4,
                                  onChanged: (Choices? value) {
                                    setState(
                                      () {
                                        q4 = value;
                                      },
                                    );
                                  },
                                ),
                                AppText.body("not-applicable"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: AppText.bodyBold("Location check"),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: <Widget>[
                      AppText.body("Is the stall in the approved location ?"),
                      const Spacer(),
                      Checkbox(
                        value: q5,
                        onChanged: (value) {
                          setState(
                            () {
                              q5 = value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 5,
                          child: AppText.body(
                              "Is the foot traffic well managed ?")),
                      const Spacer(),
                      Checkbox(
                        value: q6,
                        onChanged: (value) {
                          setState(
                            () {
                              q6 = value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  ListTile(
                    leading: const Icon(Icons.child_care),
                    title: AppText.bodyBold("Malpractices check"),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: <Widget>[
                      AppText.body("Is the working staff over 14 ?"),
                      const Spacer(),
                      Checkbox(
                        value: q7,
                        onChanged: (value) {
                          setState(
                            () {
                              q7 = value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.body("Write short description"),
                      TextField(
                        onChanged: ((value) {
                          description = value;
                        }),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      )
                    ],
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
                  verticalSpaceLarge,
                  GestureDetector(
                    onTap: () {
                      onContinue();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Review Submitted"),
                      ));
                      Navigator.of(context).pushNamed(Routes.bmcNavBar);
                    },
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 4),
                                    color: colors.kcGreyBackground),
                              ],
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: AppText.body("Submit Review"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum Choices {
  yes,
  no,
  notApplicable,
}
