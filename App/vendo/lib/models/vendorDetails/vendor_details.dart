import 'package:json_annotation/json_annotation.dart';
part 'vendor_details.g.dart';

@JsonSerializable()
class VendorModel {
  final int vendorid;
  final String name;
  final String dob;
  final String gender;
  final String address;
  final String password;
  final String phone;
  final String aadharno;
  final String pancardno;
  final bool passport;
  final bool electionid;
  final bool mcgmlicense;
  final String aadharcard;
  final String pancard;
  final String shoplocation; 
  final String token;
  final List<dynamic> complaints;
  VendorModel({
    required this.vendorid,
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
  });

   factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
