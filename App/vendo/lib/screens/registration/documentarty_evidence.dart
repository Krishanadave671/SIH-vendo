import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class DocumentaryEvidence extends StatefulWidget {
  const DocumentaryEvidence({Key? key}) : super(key: key);

  @override
  State<DocumentaryEvidence> createState() => _DocumentaryEvidence();
}

class _DocumentaryEvidence extends State<DocumentaryEvidence> {
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
                width: 300,
                child: DecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText.headingTwo(
                      "Documentary Evidence",
                      color: colors.backgroundColor,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        bottomEnd: Radius.circular(20)),
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
                    AppText.body("1.Pan Card"),
                    verticalSpaceMedium,
                    AppText.body("2.Aadhar Card"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(right: 60, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
        elevation: 0,
      ),
    );
  }
}

enum BasicOptions {
  yes,
  no,
}
