// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_complaints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorComplaintModel _$VendorComplaintModelFromJson(
        Map<String, dynamic> json) =>
    VendorComplaintModel(
      complaintId: json['complaintId'] as String,
      complaintDate: json['complaintDate'] as String,
      complaintStatus: json['complaintStatus'] as String,
      complaintType: json['complaintType'] as List<dynamic>,
      complaintImageUrl: json['complaintImageUrl'] as String,
      complaintDescription: json['complaintDescription'] as String,
      complaintLocationLat: (json['complaintLocationLat'] as num).toDouble(),
      complaintLocationLong: (json['complaintLocationLong'] as num).toDouble(),
      complaintCity: json['complaintCity'] as String,
      vendorId: json['vendorId'] as String,
    );

Map<String, dynamic> _$VendorComplaintModelToJson(
        VendorComplaintModel instance) =>
    <String, dynamic>{
      'complaintId': instance.complaintId,
      'complaintDate': instance.complaintDate,
      'complaintStatus': instance.complaintStatus,
      'complaintType': instance.complaintType,
      'complaintImageUrl': instance.complaintImageUrl,
      'complaintDescription': instance.complaintDescription,
      'complaintLocationLat': instance.complaintLocationLat,
      'complaintLocationLong': instance.complaintLocationLong,
      'complaintCity': instance.complaintCity,
      'vendorId': instance.vendorId,
    };
