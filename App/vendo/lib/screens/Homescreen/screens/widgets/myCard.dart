import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vendo/routes.dart';

import 'package:vendo/util/AppFonts/app_text.dart';

//
class MyCard extends StatelessWidget {
  final String vendorImageurl;
  final String vendorName;
  final String vendorId;
  final String vendorshopName;
  final String expiryDate;
  final String phoneNumber;
  final IconData category;

  const MyCard({
    Key? key,
    required this.vendorImageurl,
    required this.vendorName,
    required this.vendorId,
    required this.vendorshopName,
    required this.expiryDate,
    required this.phoneNumber,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 8,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 210,
        margin: const EdgeInsets.only(bottom: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(vendorImageurl),
                ),
              ),
              title: AppText.headingThree(vendorName),
              subtitle: AppText.body('Vendorid : $vendorId'),
              hoverColor: Colors.red,
              trailing: Icon(
                category,
                size: 40,
                color: Colors.green,
              ),
            ),
            Center(
                child: Text(
              vendorshopName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AppText.body1("Expiry date : $expiryDate"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      ;
                    },
                    child: Icon(
                      Icons.qr_code_scanner,
                      size: 30,
                    ),
                  ),
                  // contact us
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
