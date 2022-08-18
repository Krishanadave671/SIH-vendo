import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/services/dio_client.dart';


final vendingzonedataProvider = FutureProvider<List<VendingzoneModel?>>((ref) {
  var vendorcategory = ref.watch(vendordetailsProvider).vendorCategory;
  var taxlocation = ref.watch(vendordetailsProvider).creditScore; 
  var city = ref.watch(vendordetailsProvider).shopCity;  
  return ref.watch(apiserviceProvider).getvendingZones(
    city , 
    vendorcategory , 
    taxlocation,
  );
});
