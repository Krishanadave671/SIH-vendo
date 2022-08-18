import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'vendor_details.g.dart';

@JsonSerializable()
class VendorModel {
  String vendorid;
  String name;
  String dob;
  String gender;
  String address;
  String password;
  String phone;
  String aadharno;
  String pancardno;
  bool passport;
  bool electionid;
  bool mcgmlicense;
  String aadharcard;
  String pancard;
  String shoplocation;
  String vendorcategory;
  String token;
  String isapproved;
  int taxlocation; 
  List<dynamic> complaints;
  VendorModel(
      {required this.vendorid,
      required this.name,
      required this.dob,
      required this.gender,
      required this.address,
      required this.password,
      required this.phone,
      required this.aadharno,
      required this.pancardno,
      required this.passport,
      required this.electionid,
      required this.mcgmlicense,
      required this.aadharcard,
      required this.pancard,
      required this.shoplocation,
      required this.token,
      required this.complaints,
      required this.isapproved,
      required this.taxlocation , 
      required this.vendorcategory});

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
