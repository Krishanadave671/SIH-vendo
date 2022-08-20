import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/governmentSchemeModel/government_scheme_model.dart';

import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/services/dio_client.dart';

final governmentSchemeProvider =
    FutureProvider<List<GovernmentSchemeModel?>>((ref) {
  return ref.watch(apiserviceProvider).getGovernmentSchema();
});
