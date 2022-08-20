import 'package:json_annotation/json_annotation.dart';
part 'vendingzone_details.g.dart';

@JsonSerializable()
class VendingzoneModel {
  String vendingZoneId;
  String vendingZoneLocality;
  double vendingZoneLat;
  double vendingZoneLong;
  String vendingZoneDescription;
  String vendingZoneImageurl;
  double maximumVendorsAllowed;
  String vendingZoneCity;
  String vendingZoneWard;
  double vendingZoneLocationFee;
  String vendingZoneAddress;
  List<String> categoryOfVendorsNotAllowed;
  List<String> vendorTypeFavorable;
  List<Map<String,String>> vendorIdList;
  double pendingRegistration;
  VendingzoneModel({
    required this.vendingZoneId,
    required this.vendingZoneLocality,
    required this.vendingZoneLat,
    required this.vendingZoneLong,
    required this.vendingZoneDescription,
    required this.vendingZoneImageurl,
    required this.maximumVendorsAllowed,
    required this.vendingZoneCity,
    required this.vendingZoneWard,
    required this.vendingZoneLocationFee,
    required this.vendingZoneAddress,
    required this.categoryOfVendorsNotAllowed,
    required this.vendorTypeFavorable,
    required this.vendorIdList,
    this.pendingRegistration = 0,
  });

  factory VendingzoneModel.fromJson(Map<String, dynamic> json) =>
      _$VendingzoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendingzoneModelToJson(this);
}
