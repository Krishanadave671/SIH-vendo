import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendo/models/governmentSchemeModel/government_scheme_model.dart';
import 'dart:developer';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';

import 'package:vendo/models/vendorReviewModel/vendor_review_model.dart';
import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';

import '../../../util/AppInterface/ui_helpers.dart';
import '../../../util/error_handling.dart';
import '../models/vendorComplainsModel/vendor_complaints.dart';
import '../models/vendorDetailsModel/vendor_details.dart';

class Apiservice {
  final Dio _dio = Dio();

  static const _baseurl = "http://192.168.219.247:4000";
  static const searchallvendingzones = "/api/getvendingzones/search";
  static const vendorregistration = "/api/signup";
  static const vendorlogin = "/api/login";
  static const tokenisValid = "/api/tokenIsValid";
  static const getuserdata = "/getuserdata";
  static const addcomplaint = "/api/addcomplaint";
  static const addreview = "/";
  static const getSchema = "/api/getschemes/all";
  static const getweeklyBazzar = "/api/getbazzarsbycityandDate";
  static const registerbazzar = "/api/registerforbazzar";
  static const getdataById = "/checkapprovalstatus";
  static const postTimes = "/api/setvendortime";

  Future<List<VendingzoneModel?>> getvendingZones(
      String locationcity, String vendorcategory, double taxlocation) async {
    log("inside getvendingZones");
    try {
      log('$_baseurl$searchallvendingzones/$locationcity/$taxlocation/$vendorcategory');
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
    log("inside registerUser");
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
      showSnackBar(context, "User Registered!");
    }
  }

  Future<void> login(String phoneno, String password, BuildContext context,
      WidgetRef ref) async {
    log("inside login");
    try {
      Response response = await _dio.post(_baseurl + vendorlogin,
          data: {'phone': phoneno, 'password': password});
      log(response.toString());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('x-auth-token', response.data['token']);
      VendorModel vendordata = ref.read(vendordetailsProvider);
      vendordata = VendorModel.fromJson(response.data);
      log("inside login ${vendordata.toJson().toString()}");
      log("hash code ${vendordata.hashCode.toString()}");
      ref.read(vendordetailsProvider.notifier).loginVendor(vendordata);
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
      showSnackBar(context, "Error Logging In!!");
    }
  }

  Future<void> getuserData(BuildContext context, WidgetRef ref) async {
    log("inside get user DAta ${context.toString()}");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      _dio.options.headers['x-auth-token'] = token;
      var tokenRes = await _dio.post(_baseurl + tokenisValid);
      log(tokenRes.toString());
      var response = tokenRes.data;
      log(response.toString());
      if (response == true) {
        _dio.options.headers['x-auth-token'] = token;
        Response userRes = await _dio.get(_baseurl + getuserdata);
        VendorModel vendordata = ref.watch(vendordetailsProvider);
        vendordata = VendorModel.fromJson(userRes.data);
        log("inside api ${vendordata.toJson().toString()}");
        ref.read(vendordetailsProvider.notifier).loginVendor(vendordata);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      log("error of get user");
      log(e.toString());
    }
  }

  Future<void> addComplaint(VendorComplaintModel complaintData,
      BuildContext context, WidgetRef ref) async {
    log("inside addComplaint");
    log(complaintData.toString());
    final now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    complaintData.complaintDate = formatted;

    try {
      complaintData.complaintId = 'CI' + DateTime.now().microsecond.toString();
      log(complaintData.toJson().toString());
      ref.watch(vendordetailsProvider.notifier).addComplaint(complaintData);
      log(_baseurl + addcomplaint);
      Response response = await _dio.post(
        _baseurl + addcomplaint,
        data: complaintData.toJson(),
      );
      log(response.toString());
      log(complaintData.toJson().toString());
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Complaint Registered!!',
          );
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addReview(
      VendorReviewModel reviewData, BuildContext context) async {
    log("inside addReview");

    try {
      log(reviewData.toJson().toString());
      log(_baseurl + addreview);
      Response response = await _dio.post(
        _baseurl + addreview,
        data: reviewData.toJson(),
      );
      log(response.toString());
      log(reviewData.toJson().toString());
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Review Submitted!!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<WeeklyBazzarModel?>> getBazzar(
    String vendorCity,
    String dateSelected,
  ) async {
    log("inside getBazzar");
    try {
      Response weeklyBazzarData = await _dio.post(
        _baseurl + getweeklyBazzar,
        data: {
          "city": vendorCity,
          "bazzarDate": dateSelected,
        },
      );
      log(_baseurl + getweeklyBazzar);
      List vendingBazzars = weeklyBazzarData.data;
      log(vendingBazzars.toString());
      List<WeeklyBazzarModel?> list =
          vendingBazzars.map((e) => WeeklyBazzarModel.fromJson(e)).toList();
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
    return <WeeklyBazzarModel>[];
  }

  Future<List<GovernmentSchemeModel?>> getGovernmentSchema() async {
    log("inside getGovernmentSchema");
    try {
      log('${_baseurl + getSchema}');
      Response governmentSchemeData = await _dio.get('${_baseurl + getSchema}');
      List governmentSchemes = governmentSchemeData.data;
      List<GovernmentSchemeModel?> list = governmentSchemes
          .map((e) => GovernmentSchemeModel.fromJson(e))
          .toList();
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
    return <GovernmentSchemeModel>[];
  }

  Future<void> registerBazzar(String bazzarId, String vendorId,
      String bazzarName, BuildContext context) async {
    log("inside registerBazzar");
    try {
      log(_baseurl + registerbazzar);
      log(bazzarId);
      Response response = await _dio.post(
        _baseurl + registerbazzar,
        data: {
          "bazzarId": bazzarId,
          "vendorId": vendorId,
          "bazzarName": bazzarName,
        },
      );
      log(response.toString());

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Registered for the bazzar!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserDataFromId(BuildContext context, WidgetRef ref) async {
    log("inside get user Data from id ");
    try {
      var vendor = ref.watch(vendordetailsProvider);
      log(vendor.vendorId.toString());
      Response status = await _dio.post(
        _baseurl + getdataById,
        data: {
          "vendorId": vendor.vendorId.toString(),
        },
      );

      vendor.isApproved = status.data.toString();
    } catch (e) {
      // showSnackBar(context, e.toString());
      log("error of get status");
      log(e.toString());
    }
  }

  Future<void> putInTime(BuildContext context, WidgetRef ref) async {
    log("put maps ");
    try {
      var vendor = ref.watch(vendordetailsProvider);
      log(vendor.vendorId.toString());
      Response status = await _dio.post(
        _baseurl + postTimes,
        data: {
          "vendorId": vendor.vendorId.toString(),
          "inOrOut": vendor.inOrOut,
          "time": vendor.inTime.last,
        },
      );

      vendor.isApproved = status.data.toString();
    } catch (e) {
      // showSnackBar(context, e.toString());
      log("error of get status");
      log(e.toString());
    }
  }

  Future<void> putOutTime(BuildContext context, WidgetRef ref) async {
    log("put maps out ");
    try {
      var vendor = ref.watch(vendordetailsProvider);
      log(vendor.vendorId.toString());
      Response status = await _dio.post(
        _baseurl + postTimes,
        data: {
          "vendorId": vendor.vendorId,
          "inOrOut": vendor.inOrOut,
          "time": vendor.outTime.last,
        },
      );

      vendor.isApproved = status.data.toString();
    } catch (e) {
      // showSnackBar(context, e.toString());
      log("error of get status");
      log(e.toString());
    }
  }
}

final apiserviceProvider = Provider<Apiservice>((ref) {
  return Apiservice();
});
