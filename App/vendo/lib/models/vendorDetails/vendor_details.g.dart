// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      vendorid: json['vendorid'] as String,
      name: json['name'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      aadharno: json['aadharno'] as String,
      pancardno: json['pancardno'] as String,
      passport: json['passport'] as bool,
      electionid: json['electionid'] as bool,
      mcgmlicense: json['mcgmlicense'] as bool,
      aadharcard: json['aadharcard'] as String,
      pancard: json['pancard'] as String,
      shoplocation: json['shoplocation'] as String,
      token: json['token'] as String,
      complaints: json['complaints'] as List<dynamic>,
      isapproved: json['isapproved'] as String,
      vendorcategory: json['vendorcategory'] as String,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'vendorid': instance.vendorid,
      'name': instance.name,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'password': instance.password,
      'phone': instance.phone,
      'aadharno': instance.aadharno,
      'pancardno': instance.pancardno,
      'passport': instance.passport,
      'electionid': instance.electionid,
      'mcgmlicense': instance.mcgmlicense,
      'aadharcard': instance.aadharcard,
      'pancard': instance.pancard,
      'shoplocation': instance.shoplocation,
      'vendorcategory': instance.vendorcategory,
      'token': instance.token,
      'isapproved': instance.isapproved,
      'complaints': instance.complaints,
    };
