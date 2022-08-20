import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import '../../../models/vendorDetails/vendor_details.dart';
import '../../../util/AppInterface/ui_helpers.dart';
import '../../../util/error_handling.dart';

class Apiservice {
  final Dio _dio = Dio();

  static const _baseurl = "http://192.168.43.223:4000";
  static const searchallvendingzones = "/api/getvendingzones/search";
  static const vendorregistration = "/api/signup";
  static const vendorlogin = "/api/login";
  static const tokenisValid = "/tokenIsValid";
  static const getuserdata = "/getuserdata";

  Future<List<VendingzoneModel?>> getvendingZones(
      String locationcity, String vendorcategory, double taxlocation) async {
    try {
      Response vendingzonedata = await _dio.get(
          '$_baseurl$searchallvendingzones/$locationcity/$taxlocation/$vendorcategory');
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

  Future<void> registerUser(
      VendorModel vendordata, BuildContext context) async {
    try {
      vendordata.vendorId = 'VX' + DateTime.now().microsecond.toString();
      log(vendordata.toJson().toString());
      log(_baseurl + vendorregistration);
      Response response = await _dio.post(
        _baseurl + vendorregistration,
        data: vendordata.toJson(),
      );
      log(response.toString());
      log(vendordata.toJson().toString());
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> login(String phoneno, String password, BuildContext context,
      WidgetRef ref) async {
    try {
      Response response = await _dio.post(_baseurl + vendorlogin,
          data: {'phone': phoneno, 'password': password});
      log(response.toString());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('x-auth-token', response.data['token']);
      VendorModel vendordata = ref.read(vendordetailsProvider);
      vendordata = VendorModel.fromJson(response.data);
      log(vendordata.toJson().toString());
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('x-auth-token', vendordata.token);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.mainPage, (route) => false);
        },
      );
    } catch (e) {
      log(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getuserData(BuildContext context, WidgetRef ref) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      _dio.options.headers['x-auth-token'] = token;
      var tokenRes = await _dio.post(_baseurl + tokenisValid);
      var response = tokenRes.data;
      if (response == true) {
        _dio.options.headers['x-auth-token'] = token;
        Response userRes = await _dio.get(_baseurl + getuserdata);
        VendorModel vendordata = ref.read(vendordetailsProvider);
        vendordata = VendorModel.fromJson(userRes.data); 
        log(vendordata.toJson().toString());
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      log(e.toString());
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