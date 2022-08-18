import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';

final vendordetailsProvider = Provider<VendorModel>((ref) {
  VendorModel vendor = VendorModel(
    vendorid: '',
    name: '',
    dob: '',
    gender: "",
    address: "",
    password: "",
    phone: '',
    aadharno: '',
    token: '',
    aadharcardImageUrl: '',
    complaintsList: [],
    creditScore: 0,
    isApproved: 'pending',
    isElectionid: true,
    isMcgmlicense: true,
    isPassport: true,
    pancardImageUrl: '',
    panCardno: '',
    shopCity: '',
    reviewList: [],
    shopLocationAddress: '',
    shopLocationLat: 0,
    shopLocationLong: 0,
    vendingZoneIdApplied: '',
    vendorCategory: '',
    vendorImageUrl: '',
  );
  return vendor;
});
