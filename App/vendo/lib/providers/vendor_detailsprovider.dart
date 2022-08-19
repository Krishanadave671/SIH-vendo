import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';

final vendordetailsProvider = Provider<VendorModel>((ref) {
  VendorModel vendor = VendorModel(
    vendorId: '',
    name: '',
    dob: '',
    gender: "",
    address: "",
    password: "",
    phone: '',
    aadharNo: '',
    token: '',
    aadharcardImageUrl: '',
    complaintsList: [],
    creditScore: 0,
    isApproved: 'pending',
    isElectionid: true,
    isMcgmLicense: true,
    isPassport: true,
    pancardImageUrl: '',
    panCardNo: '',
    shopCity: '',
    reviewList: [],
    shopLocationAddress: '',
    shopLocationLat: 0,
    shopLocationLong: 0,
    vendingZoneIdApplied: '',
    vendorCategory: '',
    vendorImageUrl: '', weeklyBazzarList: [],
  );
  return vendor;
});
