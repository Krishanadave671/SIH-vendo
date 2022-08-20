import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/services/dio_client.dart';

import '../screens/WeeklyBazzar/weekly_bazzar.dart';

final weeklyBazzarProvider = FutureProvider<List<WeeklyBazzarModel?>>((ref) {
  var vendorCity = ref.watch(vendordetailsProvider).shopCity;
  var dateSelected = ref.watch(selectedDateProvider).toString();
  return ref.watch(apiserviceProvider).getBazzar(
        vendorCity,
        dateSelected,
      );
});
