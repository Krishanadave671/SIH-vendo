import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/Screens/registration/services/dio_client.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';

final vendingzonedataProvider = FutureProvider<List<VendingzoneModel?>>((ref) {
  var vendorcategory = ref.watch(vendordetailsProvider).vendorcategory;
  var taxlocation = ref.watch(vendordetailsProvider).taxlocation; 
  var city = ref.watch(vendordetailsProvider).shoplocation;  
  return ref.watch(apiserviceProvider).getvendingZones(
    city , 
    vendorcategory , 
    taxlocation
  );
});
