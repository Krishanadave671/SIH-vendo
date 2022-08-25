import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:vendo/models/vendorComplainsModel/vendor_complaints.dart';

part 'vendor_details.g.dart';

@JsonSerializable()
class VendorModel {
  String vendorId;
  String name;
  String dob;
  String gender;
  String address;
  String password;
  String phone;
  String aadharNo;
  String panCardNo;
  bool isPassport;
  bool isElectionid;
  bool isMcgmLicense;
  String aadharcardImageUrl;
  String pancardImageUrl;
  String shopLocationAddress;
  String token;
  String vendingZoneIdApplied;
  List<dynamic> reviewList;
  List<VendorComplaintModel> complaintsList;
  List<dynamic> weeklyBazzarList;
  double creditScore;
  String vendorImageurl;
  String isApproved;
  double shopLocationLat;
  double shopLocationLong;
  String vendorCategory;
  String shopCity;
  String shopName;
  List<dynamic> schemeList;
  double currentLat;
  double currentLong;
  List<dynamic> inTime;
  List<dynamic> outTime;
  bool inOrOut;

  VendorModel({
    required this.vendorId,
    required this.name,
    required this.dob,
    required this.gender,
    required this.address,
    required this.password,
    required this.phone,
    required this.aadharNo,
    required this.panCardNo,
    required this.isPassport,
    required this.isElectionid,
    required this.isMcgmLicense,
    required this.aadharcardImageUrl,
    required this.pancardImageUrl,
    required this.shopLocationAddress,
    required this.token,
    required this.vendingZoneIdApplied,
    required this.reviewList,
    required this.complaintsList,
    required this.weeklyBazzarList,
    required this.creditScore,
    required this.vendorImageurl,
    required this.isApproved,
    required this.shopLocationLat,
    required this.shopLocationLong,
    required this.vendorCategory,
    required this.shopCity,
    required this.shopName,
    required this.schemeList,
    required this.currentLat,
    required this.currentLong,
    required this.inOrOut,
    required this.inTime,
    required this.outTime,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
