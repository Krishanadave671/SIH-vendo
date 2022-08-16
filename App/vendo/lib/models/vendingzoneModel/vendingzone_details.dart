import 'package:json_annotation/json_annotation.dart';
part 'vendingzone_details.g.dart';

@JsonSerializable()
class VendingzoneModel {
  final String  vendingzoneid;
  final String vendingzonestreetName;
  final String vendingzonelocation;
  final String vendingzonedescription;
  final String vendingzoneImageurl;
  final int maximumVendorsallowed;
  final String vendingzoneward;
  final int vendingzonelocationtax; 
  VendingzoneModel({
    required this.vendingzoneid,
    required this.vendingzonestreetName,
    required this.vendingzonelocation,
    required this.vendingzonedescription,
    required this.vendingzoneImageurl,
    required this.maximumVendorsallowed,
    required this.vendingzoneward,
    required this.vendingzonelocationtax,
  });

  factory VendingzoneModel.fromJson(Map<String, dynamic> json) =>
      _$VendingzoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendingzoneModelToJson(this);
}
