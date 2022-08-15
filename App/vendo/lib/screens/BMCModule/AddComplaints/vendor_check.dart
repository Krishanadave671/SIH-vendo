import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

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
      body: Column(
        children: [
          AppText.body("shop name : ${widget.shopName}"),
          AppText.body("phone no : ${widget.phoneNo}"),
          AppText.body("vendor location : ${widget.vendorLocation}"),
          AppText.body("expiry : ${widget.expiry}"),
        ],
      ),
    );
  }
}
