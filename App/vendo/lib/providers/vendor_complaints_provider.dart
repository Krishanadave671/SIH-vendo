import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorComplains/vendor_complaints.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';

final vendorComplaintProvider = Provider<VendorComplaintModel>((ref) {
  VendorComplaintModel vendorComplaint = VendorComplaintModel(
      complaintId: "",
      complaintDate: "",
      complaintStatus: "pending",
      complaintType: "",
      complaintImageUrl: "",
      complaintDescription: "",
      complaintLocationLat: 0,
      complaintLocationLong: 0,
      complaintCity: "");
  return vendorComplaint;
});
