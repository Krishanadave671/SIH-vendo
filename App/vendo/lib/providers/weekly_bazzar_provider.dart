import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:vendo/models/weeklyBazzarModel/weekly_bazzar_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/services/dio_client.dart';

import '../screens/WeeklyBazzar/weekly_bazzar.dart';

final weeklyBazzarProvider = FutureProvider<List<WeeklyBazzarModel?>>((ref) {
  var vendorCity = ref.watch(vendordetailsProvider).shopCity;
  var dateSelected = ref.watch(selectedDateProvider);
  // final now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(dateSelected[0]!);
  log(formatted);
  return ref.watch(apiserviceProvider).getBazzar(
        vendorCity,
        formatted,
      );
});
