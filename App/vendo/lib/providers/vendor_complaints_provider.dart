import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorComplains/vendor_complaints.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

final vendorComplaintProvider = Provider<VendorComplaintModel>((ref) {
  var vendorId = ref.watch(vendordetailsProvider).vendorId;
  var vendorCity = ref.watch(vendordetailsProvider).shopCity;
  VendorComplaintModel vendorComplaint = VendorComplaintModel(
    complaintId: "",
    complaintDate: "",
    complaintStatus: "pending",
    complaintType: "",
    complaintImageUrl: "",
    complaintDescription: "",
    complaintLocationLat: 0,
    complaintLocationLong: 0,
    complaintCity: vendorCity,
    vendorId: vendorId,
   
  );
  return vendorComplaint;
});
