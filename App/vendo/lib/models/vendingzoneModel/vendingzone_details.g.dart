// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendingzone_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendingzoneModel _$VendingzoneModelFromJson(Map<String, dynamic> json) =>
    VendingzoneModel(
      vendingzoneid: json['vendingzoneid'] as int,
      vendingzonestreetName: json['vendingzonestreetName'] as String,
      vendingzonelocation: json['vendingzonelocation'] as String,
      vendingzonedescription: json['vendingzonedescription'] as String,
      vendingzoneImageurl: json['vendingzoneImageurl'] as String,
      maximumVendorsallowed: json['maximumVendorsallowed'] as int,
      vendingzoneward: json['vendingzoneward'] as String,
      vendingzonelocationtax: json['vendingzonelocationtax'] as int,
    );

Map<String, dynamic> _$VendingzoneModelToJson(VendingzoneModel instance) =>
    <String, dynamic>{
      'vendingzoneid': instance.vendingzoneid,
      'vendingzonestreetName': instance.vendingzonestreetName,
      'vendingzonelocation': instance.vendingzonelocation,
      'vendingzonedescription': instance.vendingzonedescription,
      'vendingzoneImageurl': instance.vendingzoneImageurl,
      'maximumVendorsallowed': instance.maximumVendorsallowed,
      'vendingzoneward': instance.vendingzoneward,
      'vendingzonelocationtax': instance.vendingzonelocationtax,
    };
