import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class NationalityEvidence extends StatefulWidget {
  const NationalityEvidence({Key? key}) : super(key: key);

  @override
  State<NationalityEvidence> createState() => _NationalityEvidenceState();
}

class _NationalityEvidenceState extends State<NationalityEvidence> {
  BasicOptions? _passport = BasicOptions.yes;
  BasicOptions? _election = BasicOptions.yes;
  BasicOptions? _liscense = BasicOptions.yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
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
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8),
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Aadhar Card Number',
                              hintText: 'Enter Aadhar Card Number'),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    DecoratedBox(
                      decoration: borderBoxOutline,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextField(
                          decoration: InputDecoration(
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
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
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
    );
  }
}

enum BasicOptions {
  yes,
  no,
}
