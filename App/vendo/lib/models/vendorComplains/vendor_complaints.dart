import 'package:json_annotation/json_annotation.dart';
part 'vendor_complaints.g.dart';

@JsonSerializable()
class VendorComplaintModel {
  String complaintId;
  String complaintDate;
  String complaintStatus;
  String complaintType;
  String complaintImageUrl;
  String complaintDescription;
  double complaintLocationLat;
  double complaintLocationLong;
  String complaintCity;
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
  });

  factory VendorComplaintModel.fromJson(Map<String, dynamic> json) =>
      _$VendorComplaintModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorComplaintModelToJson(this);
}