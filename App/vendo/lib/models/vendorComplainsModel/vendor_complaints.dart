import 'package:json_annotation/json_annotation.dart';
part 'vendor_complaints.g.dart';

@JsonSerializable()
class VendorComplaintModel {
  String complaintId;
  String complaintDate;
  String complaintStatus;
  List<dynamic> complaintType;
  String complaintImageUrl;
  String complaintDescription;
  double complaintLocationLat;
  double complaintLocationLong;
  String complaintCity;
  String vendorId;

  VendorComplaintModel({
    required this.complaintId,
    required this.complaintDate,
    required this.complaintStatus,
    required this.complaintType,
    required this.complaintImageUrl,
    required this.complaintDescription,
    required this.complaintLocationLat,
    required this.complaintLocationLong,
    required this.complaintCity,
    required this.vendorId,
  });

  factory VendorComplaintModel.fromJson(Map<String, dynamic> json) =>
      _$VendorComplaintModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorComplaintModelToJson(this);
}
