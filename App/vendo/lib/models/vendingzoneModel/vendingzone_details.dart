import 'package:json_annotation/json_annotation.dart';
part 'vendingzone_details.g.dart';

@JsonSerializable()
class VendingzoneModel {
  final String vendingZoneId;
  final String vendingZoneLocality;
  final double vendingZoneLat;
  final double vendingZoneLong;
  final String vendingZoneDescription;
  final String vendingZoneImageUrl;
  final double maximumVendorsAllowed;
  final String vendingZoneCity;
  final String vendingZoneWard;
  final double vendingZoneLocationFee;
  final String vendingZoneAddress;
  final List<String> categoryOfVendorsNotAllowed;
  final List<String> vendorTypeFavourable;
  final List<String> vendorIdList;
  VendingzoneModel({
    required this.vendingZoneId,
    required this.vendingZoneLocality,
    required this.vendingZoneLat,
    required this.vendingZoneLong,
    required this.vendingZoneDescription,
    required this.vendingZoneImageUrl,
    required this.maximumVendorsAllowed,
    required this.vendingZoneCity,
    required this.vendingZoneWard,
    required this.vendingZoneLocationFee,
    required this.vendingZoneAddress,
    required this.categoryOfVendorsNotAllowed,
    required this.vendorTypeFavourable,
    required this.vendorIdList,
  });

  factory VendingzoneModel.fromJson(Map<String, dynamic> json) =>
      _$VendingzoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendingzoneModelToJson(this);
}
