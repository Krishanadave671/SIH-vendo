import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendo/models/vendorDetailsModel/vendor_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

import 'package:vendo/screens/Main_page/mainpage.dart';
import 'package:vendo/screens/registration/space_allocation.dart';
import '../../../services/dio_client.dart';
import '../../language_selector/language_selector.dart';

class WhereToDirect extends ConsumerStatefulWidget {
  const WhereToDirect({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WhereToDirect();
}

String go = "/";
final goProvider = StateProvider<String>((ref) {
  return go;
});

class _WhereToDirect extends ConsumerState<WhereToDirect> {
  final Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  late VendorModel vendor;
  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  Future<void> tokenGeneration(WidgetRef ref) async {
    // log(ref.watch(goProvider.notifier).state);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('x-auth-token') ?? "";
    print("token : $token");
    ref.watch(goProvider.notifier).state = token;

    // log(ref.watch(goProvider.notifier).state);
  }

  @override
  Widget build(BuildContext context) {
    vendor = ref.watch(vendordetailsProvider);
    tokenGeneration(ref);
    _listenLocation();

    String comp = ref.watch(goProvider);
    if (comp == "/") {
      ref.watch(apiserviceProvider).getuserData(context, ref);
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (comp == "") {
      return const LanguageSelector();
    } else {
      return const MainPage();
    } 

    // return FutureBuilder<String>(
    //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    //     if (snapshot.data == '0') {
    //       return const LoginScreen();
    //     } else {
    //       return const MainPage();
    //     }
    //   },
    //   future: tokenGeneration(),
    // );
  }

  _getLocation() async {
    try {
      final LocationData _locationResult = await location.getLocation();
      // await FirebaseFirestore.instance.collection('location').doc('user1').set({
      //   'latitude': _locationResult.latitude,
      //   'longitude': _locationResult.longitude,
      //   'name': 'john'
      // }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((LocationData currentlocation) async {
      print(currentlocation.toString());
      vendor.currentLat = currentlocation.latitude!.toDouble();
      vendor.currentLong = currentlocation.longitude!.toDouble();
      print("${vendor.currentLat},${vendor.currentLong}");
      double distance = getDistanceFromLatLonInKm(vendor.shopLocationLat,
          vendor.shopLocationLong, vendor.currentLat, vendor.currentLong);
      print("distance : $distance");
      if (distance > 1 && vendor.inOrOut == true) {
        vendor.inOrOut = false;
        print(
            "outtime : ${DateTime.now().hour.toString()},${DateTime.now().minute.toString()}");
        vendor.inTime.add(
            "${DateTime.now().hour.toString()},${DateTime.now().minute.toString()}");
        final _api = ref.watch(apiserviceProvider);
        _api.putOutTime(context, ref);
      } else if (distance < 1 && vendor.inOrOut == false) {
        vendor.inOrOut = true;
        print(
            "intime :${DateTime.now().hour.toString()},${DateTime.now().minute.toString()}");
        vendor.outTime.add(
            "${DateTime.now().hour.toString()},${DateTime.now().minute.toString()}");
        final _api = ref.watch(apiserviceProvider);
        _api.putInTime(context, ref);
      }

      // await FirebaseFirestore.instance.collection('location').doc('user1').set({
      //   'latitude': currentlocation.latitude,
      //   'longitude': currentlocation.longitude,
      //   'name': 'john'
      // }, SetOptions(merge: true));
    });
  }

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (3.14 / 180);
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
