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
            isApproved: 'pending',
            shopLocationLat: 26.8377363,
            shopLocationLong: 75.653357,
            vendorCategory: '',
            shopCity: '',
            shopName: '',
            schemeList: [],
            currentLat: 0,
            currentLong: 0,
            inTime: [],
            outTime: [],
            inOrOut: true,
          ),
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
