import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/Screens/registration/services/dio_client.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';

final vendingzonedataProvider = FutureProvider<List<VendingzoneModel?>>((ref) {
  return ref.watch(apiserviceProvider).getvendingZones();
});

