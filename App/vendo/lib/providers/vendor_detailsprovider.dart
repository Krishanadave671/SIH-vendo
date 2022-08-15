import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendorDetails/vendor_details.dart';

final vendordetailsProvider = Provider<VendorModel>((ref) {
  VendorModel vendor = VendorModel(
      vendorid: 12334,
      name: '',
      dob: '',
      gender: "",
      address: "",
      password: "",
      phone: '',
      aadharno: '',
      pancardno: '',
      passport: false,
      electionid: false,
      mcgmlicense: false,
      aadharcard: "",
      pancard: '',
      shoplocation: '',
      token: '',
      complaints: []); 
  return vendor;
});
