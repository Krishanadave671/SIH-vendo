import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'vendor_review_model.g.dart';

@JsonSerializable()
class VendorReviewModel {
  String vendorId;
  String waterClogging;
  String foodCover;
  String cleanDrinkingWater;
  String vendorWearingGloves;
  String bmcOfficerId;
  bool isApprovedLocation;
  bool isFootTraffic;
  bool isLegalAge;
  String shortDescription;
  String reviewImageUrl;
  double creditScoreAbsolute;
  String reviewId;

  VendorReviewModel({
    required this.reviewId,
    required this.vendorId,
    required this.waterClogging,
    required this.foodCover,
    required this.cleanDrinkingWater,
    required this.vendorWearingGloves,
    required this.bmcOfficerId,
    required this.isApprovedLocation,
    required this.isFootTraffic,
    required this.isLegalAge,
    required this.shortDescription,
    required this.reviewImageUrl,
    required this.creditScoreAbsolute,
  });

  factory VendorReviewModel.fromJson(Map<String, dynamic> json) =>
      _$VendorReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorReviewModelToJson(this);
}
