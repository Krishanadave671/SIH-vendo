import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzone_details.dart';

class DioClient {
  final Dio _dio = Dio();
  static const _baseurl = "http://192.168.1.100:3000";
  static const searchvendingzones = "/api/getvendingzones/search";

  Future<List<VendingzoneModel?>> getvendingZones() async {
    try {
      Response vendingzonedata = await _dio.get(_baseurl + searchvendingzones);
      // log("data is as follows : ${vendingzonedata.data}");
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
}

final vendingzoneProvider = Provider<DioClient>((ref) {
  return DioClient();
});
