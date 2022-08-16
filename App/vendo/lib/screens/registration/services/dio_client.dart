import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

import '../../../models/vendorDetails/vendor_details.dart';

class Apiservice {
  final Dio _dio = Dio();
  static const _baseurl = "http://192.168.1.101:4000";
  static const searchallvendingzones = "/api/getvendingzones/search";
  static const vendorregistration = "/api/signup";
  static const vendorlogin = "/api/login";

  Future<List<VendingzoneModel?>> getvendingZones(
      String locationcity, String vendorcategory, int taxlocation) async {
    try {
      Response vendingzonedata =
          await _dio.get('$_baseurl$searchallvendingzones/$locationcity/$taxlocation/$vendorcategory');
      List vendingzones = vendingzonedata.data;
      List<VendingzoneModel?> list =
          vendingzones.map((e) => VendingzoneModel.fromJson(e)).toList();
      log(list[0].toString());
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

  Future<Response> registerUser(VendorModel vendordata) async {
    try {
      vendordata.vendorid = 'VX' + DateTime.now().microsecond.toString();
      log(vendordata.toJson().toString());
      log(vendordata.toString());
      log(_baseurl + vendorregistration);

      Response response = await _dio.post(
        _baseurl + vendorregistration,
        data: vendordata.toJson(),
      );
      log(response.toString());
      log(vendordata.toJson().toString());

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
      return e.response?.data;
    }
  }
}

final apiserviceProvider = Provider<Apiservice>((ref) {
  return Apiservice();
});


// @freezed
// class SendDataResponse with _$SendDataResponse {
//   SendDataResponse._();

//   factory SendDataResponse({
//     @JsonKey(name: "success") bool? success,
//   }) = _SendDataResponse;

//   factory SendDataResponse.fromJson(Map<String, dynamic> json) =>
//       _$SendDataResponseFromJson(json);
// }

// @JsonSerializable(explicitToJson: true)
// class SetAWSDrivingFilesBody {
  
//   final String drivingLicence;

//   SetAWSDrivingFilesBody(
    
//     this.drivingLicence,
//   );

//   factory SetAWSDrivingFilesBody.fromJson(Map<String, dynamic> json) =>
//       _$SetAWSDrivingFilesBodyFromJson(json);

//   Map<String, dynamic> toJson() => _$SetAWSDrivingFilesBodyToJson(this);
// }