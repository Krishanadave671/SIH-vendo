import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vendo/models/vendorReviewModel/vendor_review_model.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/services/dio_client.dart';

final vendorReviewProvider = Provider<VendorReviewModel>((ref) {
  VendorReviewModel vendorReview = VendorReviewModel(
    waterClogging: "yes",
    foodCover: "yes",
    cleanDrinkingWater: "yes",
    vendorWearingGloves: "yes",
    bmcOfficerId: "${'BM' + DateTime.now().microsecond.toString()}",
    isApprovedLocation: false,
    isFootTraffic: false,
    isLegalAge: false,
    shortDescription: "",
    reviewImageUrl: "",
    creditScoreAbsolute: 0,
    vendorId: "",
    reviewId: "",
  );
  return vendorReview;
});

final myfeedbackProvider = FutureProvider<List<VendorReviewModel?>>((ref) {
  return ref
      .watch(apiserviceProvider)
      .getMyFeedbacks(ref.watch(vendorReviewProvider).bmcOfficerId);
});

final vendorFeedbackProvider = FutureProvider<List<VendorReviewModel?>>((ref) {
  return ref
      .watch(apiserviceProvider)
      .getVendorFeedback(ref.watch(vendordetailsProvider).vendorId);
});

class FeedbackNotifier extends StateNotifier<List<VendorReviewModel>> {
  FeedbackNotifier() : super([]);

  void addReview(VendorReviewModel model) {
    state = [...state, model];
  }
}

final feedbackProvider =
    StateNotifierProvider<FeedbackNotifier, List<VendorReviewModel>>((ref) {
  return FeedbackNotifier();
});


