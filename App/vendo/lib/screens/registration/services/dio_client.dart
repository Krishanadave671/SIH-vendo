import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendo/Screens/Main_page/mainpage.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import '../../../models/vendorDetails/vendor_details.dart';
import '../../../util/AppInterface/ui_helpers.dart';
import '../../../util/error_handling.dart';

class Apiservice {
  final Dio _dio = Dio();
  static const _baseurl = "http://192.168.43.223:4000";
  static const searchallvendingzones = "/api/getvendingzones/search";
  static const vendorregistration = "/api/signup";
  static const vendorlogin = "/api/login";

  Future<List<VendingzoneModel?>> getvendingZones(
      String locationcity, String vendorcategory, int taxlocation) async {
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
          data: jsonEncode({'phone': phoneno, 'password': password}));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('x-Auth-token', jsonDecode(response.data)['token']);
      final vendordata = ref.read(vendordetailsProvider);
      vendordata.token = response.data['token']; 

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              'x-auth-token', jsonDecode(response.data)['token']);
            showSnackBar(context, 'Login successfully'); 
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
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