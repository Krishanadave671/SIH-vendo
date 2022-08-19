import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import '../../providers/vendor_detailsprovider.dart';
import '../../routes.dart';

class DocumentaryEvidence extends ConsumerStatefulWidget {
  const DocumentaryEvidence({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DocumentaryEvidenceState();
}

class _DocumentaryEvidenceState extends ConsumerState<DocumentaryEvidence> {
  @override
  void initState() {
    uniqueString = 'VX' + DateTime.now().toString().substring(0, 5);
    panPathString = 'vendor_documents/$uniqueString/pan.jpeg';
    aadharPathString = 'vendor_documents/$uniqueString/aadhar.jpeg';
    super.initState();
  }

  bool uploadedAdhar = false;
  bool uploadedPan = false;
  late final panCardRef;
  late final panImage;
  late final aadharRef;
  late final aadharImage;
  late final String uniqueString;
  late final String panPathString;
  late final String aadharPathString;

  Future<void> uploadPan() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'png'],
      );
    } catch (e) {
      print(e);
    }
    File file = File(result!.paths[0]!);

    try {
      final storage = FirebaseStorage.instance;
      panCardRef = storage.ref().child(panPathString);
      await panCardRef.putFile(file, SettableMetadata(contentType: "jpeg/png"));
      await getPan();
      setState(() {
        uploadedPan = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPan() async {
    try {
      final link = await panCardRef.getDownloadURL();
      print("hii");
      print(link);
      setState(() {
        panImage = link;
      });
    } on FirebaseException catch (e) {}
  }

  Future<void> getAadhar() async {
    try {
      final link = await aadharRef.getDownloadURL();
      setState(() {
        aadharImage = link;
      });
    } on FirebaseException catch (e) {}
  }

  Future<void> uploadAadhar() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'png'],
      );
    } catch (e) {
      print(e);
    }
    File file = File(result!.paths[0]!);

    try {
      final storage = FirebaseStorage.instance;
      aadharRef = storage.ref().child(aadharPathString);
      await aadharRef.putFile(file, SettableMetadata(contentType: "jpeg"));
      await getAadhar();
      setState(() {
        uploadedAdhar = true;
      });
    } catch (e) {
      print(e);
    }
  }

  void onContinue() {
    //implement api here;
    final vendordata = ref.read(vendordetailsProvider);
    vendordata.aadharcardImageUrl = aadharImage;
    vendordata.pancardImageUrl = panImage;
    print("end game : $aadharImage , $panImage ");
  }

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
      body: SingleChildScrollView(
        child: Container(
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
                      AppText.bodyBold(
                          "Upload all Documents in png or jpeg format"),
                      verticalSpaceLarge,
                      Row(
                        children: [
                          AppText.body("1.Pan Card"),
                          horizontalSpaceLarge,
                          GestureDetector(
                            onTap: () {
                              uploadPan();
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: (uploadedPan)
                                      ? Colors.green
                                      : colors.primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(Icons.file_upload_outlined),
                            ),
                          ),
                        ],
                      ),
                      horizontalSpaceSmall,
                      (uploadedPan)
                          ? SizedBox(
                              height: 200,
                              child: Image.network(panImage.toString(),
                                  fit: BoxFit.scaleDown),
                            )
                          : SizedBox(),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          AppText.body("2.Aadhar Card"),
                          horizontalSpaceLarge,
                          GestureDetector(
                            onTap: () {
                              uploadAadhar();
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: (uploadedAdhar)
                                      ? Colors.green
                                      : colors.primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(Icons.file_upload_outlined),
                            ),
                          ),
                        ],
                      ),
                      horizontalSpaceSmall,
                      (uploadedAdhar)
                          ? SizedBox(
                              height: 200,
                              child: Image.network(aadharImage.toString(),
                                  fit: BoxFit.scaleDown),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            onContinue();
            Navigator.of(context).pushNamed(Routes.spaceallocation);
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
