import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorComplainsModel/vendor_complaints.dart';

import '../models/vendorDetailsModel/vendor_details.dart';

class VendorNotifier extends StateNotifier<VendorModel> {
  VendorNotifier()
      : super(
          VendorModel(
              vendorId: '',
              name: '',
              dob: '',
              gender: '',
              address: '',
              password: '',
              phone: '',
              aadharNo: '',
              panCardNo: '',
              isPassport: true,
              isElectionid: true,
              isMcgmLicense: true,
              aadharcardImageUrl: '',
              pancardImageUrl: '',
              shopLocationAddress: '',
              token: '',
              vendingZoneIdApplied: '',
              reviewList: [],
              complaintsList: [],
              weeklyBazzarList: [],
              creditScore: 0,
              vendorImageurl: '',
              isApproved: '',
              shopLocationLat: 0,
              shopLocationLong: 0,
              vendorCategory: '',
              shopCity: '',
              shopName: '',
              schemeList: []),
        );

  void loginVendor(VendorModel model) {
    state = model;
  }

  void addComplaint(VendorComplaintModel model) {
    state.complaintsList = [...state.complaintsList, model];
  }
}

final vendordetailsProvider =
    StateNotifierProvider<VendorNotifier, VendorModel>((ref) {
  return VendorNotifier();
});
