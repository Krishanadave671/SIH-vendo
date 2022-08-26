import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/colors.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final String uniqueString = "*7%";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? const Center(child: CircularProgressIndicator())
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        setState(() {
          result = scanData;
        });

        //0 = shop name
        //1 = vendor location
        //2 = expiry
        //3 = vendor phone no
        //4 = end string

        if (scanData.code!.endsWith(uniqueString)) {
          controller.pauseCamera();
          var listData = scanData.code!.split('\n');
          for (int i = 0; i < listData.length; i++) {
            listData[i] = listData[i].substring(3).trim();
          }

          Navigator.of(context).pushReplacementNamed(
            Routes.vendorCheck,
            arguments: VendorCheckArguments(
              shopName: listData[0],
              expiry: listData[2],
              vendorLocation: listData[1],
              phoneNo: listData[3],
              id : listData[4],
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
