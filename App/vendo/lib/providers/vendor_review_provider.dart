import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vendo/models/vendorReviewModel/vendor_review_model.dart';

final vendorReviewProvider = Provider<VendorReviewModel>((ref) {
  VendorReviewModel vendorReview = VendorReviewModel(
    waterClogging: "yes",
    foodCover: "yes",
    cleanDrinkingWater: "yes",
    vendorWearingGloves: "yes",
    bmcOfficerId: "",
    isApprovedLocation: false,
    isFootTraffic: false,
    isLegalAge: false,
    shortDescription: "",
    reviewImageUrl: "",
    creditScoreAbsolute: 0,
  );
  return vendorReview;
});
