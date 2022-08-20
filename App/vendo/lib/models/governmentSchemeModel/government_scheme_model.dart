import 'package:json_annotation/json_annotation.dart';
part 'government_scheme_model.g.dart';

@JsonSerializable()
class GovernmentSchemeModel {
  String schemeId;
  String schemeName;
  String schemeReq;
  String schemeBenefits;
  String schemeImageUrl;

  GovernmentSchemeModel({
    required this.schemeId,
    required this.schemeName,
    required this.schemeBenefits,
    required this.schemeImageUrl,
    required this.schemeReq,
  });

  factory GovernmentSchemeModel.fromJson(Map<String, dynamic> json) =>
      _$GovernmentSchemeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernmentSchemeModelToJson(this);
}
