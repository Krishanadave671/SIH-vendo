// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorReviewModel _$VendorReviewModelFromJson(Map<String, dynamic> json) =>
    VendorReviewModel(
      reviewId: json['reviewId'] as String,
      vendorId: json['vendorId'] as String,
      waterClogging: json['waterClogging'] as String,
      foodCover: json['foodCover'] as String,
      cleanDrinkingWater: json['cleanDrinkingWater'] as String,
      vendorWearingGloves: json['vendorWearingGloves'] as String,
      bmcOfficerId: json['bmcOfficerId'] as String,
      isApprovedLocation: json['isApprovedLocation'] as bool,
      isFootTraffic: json['isFootTraffic'] as bool,
      isLegalAge: json['isLegalAge'] as bool,
      shortDescription: json['shortDescription'] as String,
      reviewImageUrl: json['reviewImageUrl'] as String,
      creditScoreAbsolute: (json['creditScoreAbsolute'] as num).toDouble(),
    );

Map<String, dynamic> _$VendorReviewModelToJson(VendorReviewModel instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'waterClogging': instance.waterClogging,
      'foodCover': instance.foodCover,
      'cleanDrinkingWater': instance.cleanDrinkingWater,
      'vendorWearingGloves': instance.vendorWearingGloves,
      'bmcOfficerId': instance.bmcOfficerId,
      'isApprovedLocation': instance.isApprovedLocation,
      'isFootTraffic': instance.isFootTraffic,
      'isLegalAge': instance.isLegalAge,
      'shortDescription': instance.shortDescription,
      'reviewImageUrl': instance.reviewImageUrl,
      'creditScoreAbsolute': instance.creditScoreAbsolute,
      'reviewId': instance.reviewId,
    };
