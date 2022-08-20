// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'government_scheme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernmentSchemeModel _$GovernmentSchemeModelFromJson(
        Map<String, dynamic> json) =>
    GovernmentSchemeModel(
      schemeId: json['schemeId'] as String,
      schemeName: json['schemeName'] as String,
      schemeBenefits: json['schemeBenefits'] as String,
      schemeImageUrl: json['schemeImageUrl'] as String,
      schemeReq: json['schemeReq'] as String,
    );

Map<String, dynamic> _$GovernmentSchemeModelToJson(
        GovernmentSchemeModel instance) =>
    <String, dynamic>{
      'schemeId': instance.schemeId,
      'schemeName': instance.schemeName,
      'schemeReq': instance.schemeReq,
      'schemeBenefits': instance.schemeBenefits,
      'schemeImageUrl': instance.schemeImageUrl,
    };
