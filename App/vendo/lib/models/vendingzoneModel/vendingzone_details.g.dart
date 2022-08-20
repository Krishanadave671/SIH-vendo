// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendingzone_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendingzoneModel _$VendingzoneModelFromJson(Map<String, dynamic> json) =>
    VendingzoneModel(
      vendingZoneId: json['vendingZoneId'] as String,
      vendingZoneLocality: json['vendingZoneLocality'] as String,
      vendingZoneLat: (json['vendingZoneLat'] as num).toDouble(),
      vendingZoneLong: (json['vendingZoneLong'] as num).toDouble(),
      vendingZoneDescription: json['vendingZoneDescription'] as String,
      vendingZoneImageurl: json['vendingZoneImageurl'] as String,
      maximumVendorsAllowed: (json['maximumVendorsAllowed'] as num).toDouble(),
      vendingZoneCity: json['vendingZoneCity'] as String,
      vendingZoneWard: json['vendingZoneWard'] as String,
      vendingZoneLocationFee:
          (json['vendingZoneLocationFee'] as num).toDouble(),
      vendingZoneAddress: json['vendingZoneAddress'] as String,
      categoryOfVendorsNotAllowed:
          (json['categoryOfVendorsNotAllowed'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      vendorTypeFavorable: (json['vendorTypeFavorable'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      vendorIdList: (json['vendorIdList'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      pendingRegistration:
          (json['pendingRegistration'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$VendingzoneModelToJson(VendingzoneModel instance) =>
    <String, dynamic>{
      'vendingZoneId': instance.vendingZoneId,
      'vendingZoneLocality': instance.vendingZoneLocality,
      'vendingZoneLat': instance.vendingZoneLat,
      'vendingZoneLong': instance.vendingZoneLong,
      'vendingZoneDescription': instance.vendingZoneDescription,
      'vendingZoneImageurl': instance.vendingZoneImageurl,
      'maximumVendorsAllowed': instance.maximumVendorsAllowed,
      'vendingZoneCity': instance.vendingZoneCity,
      'vendingZoneWard': instance.vendingZoneWard,
      'vendingZoneLocationFee': instance.vendingZoneLocationFee,
      'vendingZoneAddress': instance.vendingZoneAddress,
      'categoryOfVendorsNotAllowed': instance.categoryOfVendorsNotAllowed,
      'vendorTypeFavorable': instance.vendorTypeFavorable,
      'vendorIdList': instance.vendorIdList,
      'pendingRegistration': instance.pendingRegistration,
    };
