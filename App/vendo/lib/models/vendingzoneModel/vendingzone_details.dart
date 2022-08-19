import 'package:json_annotation/json_annotation.dart';
part 'vendingzone_details.g.dart';

@JsonSerializable()
class VendingzoneModel {
  String vendingZoneId;
  String vendingZoneLocality;
  double vendingZoneLat;
  double vendingZoneLong;
  String vendingZoneDescription;
  String vendingZoneImageUrl;
  double maximumVendorsAllowed;
  String vendingZoneCity;
  String vendingZoneWard;
  double vendingZoneLocationFee;
  String vendingZoneAddress;
  List<String> categoryOfVendorsNotAllowed;
  List<String> vendorTypeFavourable;
  List<String> vendorIdList;
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
