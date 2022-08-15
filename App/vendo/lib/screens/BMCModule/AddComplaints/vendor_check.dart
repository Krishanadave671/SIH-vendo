import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/colors.dart';
import '../../../util/AppInterface/ui_helpers.dart';

class VendorCheck extends StatefulWidget {
  const VendorCheck({
    Key? key,
    required this.shopName,
    required this.expiry,
    required this.vendorLocation,
    required this.phoneNo,
  }) : super(key: key);
  final String shopName;
  final String vendorLocation;
  final String expiry;
  final String phoneNo;

  @override
  State<VendorCheck> createState() => _VendorCheckState();
}

class _VendorCheckState extends State<VendorCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.bmcNavBar);
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
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
                  AppText.bodyBold("Shop Name : ${widget.shopName}"),
                  verticalSpaceMedium,
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Check complete!"),
                        ),
                      );
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
                            child: AppText.body("Submit"),
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
