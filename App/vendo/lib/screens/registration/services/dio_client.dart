import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

class Apiservice {
  final Dio _dio = Dio();
  static const _baseurl = "http://192.168.1.100:3000";
  static const searchvendingzones = "/api/getvendingzones/search";
  static const vendorregistration = "/api/signup";
  static const vendorlogin = "/api/login";

  Future<List<VendingzoneModel?>> getvendingZones() async {
    try {
      Response vendingzonedata = await _dio.get(_baseurl + searchvendingzones);
      List vendingzones = vendingzonedata.data;
      List<VendingzoneModel> list =
          vendingzones.map((e) => VendingzoneModel.fromJson(e)).toList();
      log(list[0].vendingzonedescription);
      return list;
    } on DioError catch (e) {
      if (e.response != null) {
        log('Dio error!');
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log(e.message);
      }
    }
    return <VendingzoneModel>[];
  }

  Future<Response> registerUser(WidgetRef ref) async {
    try {
      VendorModel vendordata = ref.watch(vendordetailsProvider); 
      Response response = await _dio.post(_baseurl + vendorregistration,
          data: vendordata.toJson(),
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> login(String phoneno, String password) async {
    try {
      Response response = await _dio.post(_baseurl + vendorlogin,
          data: {"phone": phoneno, "password": password});
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}

final apiserviceProvider = Provider<Apiservice>((ref) {
  return Apiservice();
});
