import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class NationalityEvidence extends ConsumerStatefulWidget {
  const NationalityEvidence({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NationalityEvidenceState();
}

class _NationalityEvidenceState extends ConsumerState<NationalityEvidence> {
  BasicOptions? _passport = BasicOptions.yes;
  BasicOptions? _election = BasicOptions.yes;
  BasicOptions? _liscense = BasicOptions.yes;
  String _aadhar = '';
  String _pan = '';

  void uploadNationalityDetails() {
    bool passport = true;
    bool election = true;
    bool liscense = true;
    switch (_passport) {
      case BasicOptions.yes:
        passport = true;
        break;
      case BasicOptions.no:
        passport = false;
        break;
    }
    switch (_election) {
      case BasicOptions.yes:
        election = true;
        break;
      case BasicOptions.no:
        election = false;
        break;
    }
    switch (_liscense) {
      case BasicOptions.yes:
        liscense = true;
        break;
      case BasicOptions.no:
        liscense = false;
        break;
    }
    final vendordata = ref.read(vendordetailsProvider);
    vendordata.isPassport = passport;
    vendordata.aadharNo = _aadhar;
    vendordata.panCardNo = _pan;
    vendordata.isElectionid = election;
    vendordata.isMcgmLicense = liscense;
    //make api call here
    print("nationality $_aadhar , $_pan , $passport , $election , $liscense ");
    log(vendordata.toJson().toString());
  }

  RegExp exp = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');

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
                  width: 350,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(20),
                          bottomEnd: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AppText.headingTwo(
                          "Nationality Evidence",
                          color: colors.backgroundColor,
                        ),
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
                      DecoratedBox(
                        decoration: borderBoxOutline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            maxLength: 12,
                            onChanged: (value) {
                              _aadhar = value;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Aadhar Card Number',
                                hintText: 'Enter Aadhar Card Number'),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      DecoratedBox(
                        decoration: borderBoxOutline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            maxLength: 10,
                            onChanged: (value) {
                              _pan = value;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Pan Card Number',
                                hintText: 'Enter Pan Card Number'),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      AppText.bodyBold("Do you have passport?"),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("Yes"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.yes,
                                groupValue: _passport,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _passport = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("No"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.no,
                                groupValue: _passport,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _passport = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      AppText.bodyBold("Do you have Election Id?"),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("Yes"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.yes,
                                groupValue: _election,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _election = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("No"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.no,
                                groupValue: _election,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _election = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      AppText.bodyBold("Do you have MCGM Liscense issued?"),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("Yes"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.yes,
                                groupValue: _liscense,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _liscense = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ListTile(
                              title: AppText.body("No"),
                              leading: Radio<BasicOptions>(
                                value: BasicOptions.no,
                                groupValue: _liscense,
                                onChanged: (BasicOptions? value) {
                                  setState(() {
                                    _liscense = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
            RegExp exp = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');
            RegExp exp1 = RegExp(r'[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}');
            if (exp.hasMatch(_pan) == true && exp1.hasMatch(_aadhar)==true) {
              uploadNationalityDetails();
              Navigator.of(context).pushNamed(Routes.documentaryEvidence);
            } else if (exp.hasMatch(_pan) == false) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                        title: Text("Enter valid PAN number"),
                      ));
            } else if (exp1.hasMatch(_aadhar) == false) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                        title: Text("Enter valid Adhaar number"),
                      ));
            }
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
