// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_bazzar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyBazzarModel _$WeeklyBazzarModelFromJson(Map<String, dynamic> json) =>
    WeeklyBazzarModel(
      bazzarId: json['bazzarId'] as String,
      vendorTypeFavourable: (json['vendorTypeFavourable'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bazzarImageUrl: json['bazzarImageUrl'] as String,
      bazzarLat: (json['bazzarLat'] as num).toDouble(),
      bazzarLong: (json['bazzarLong'] as num).toDouble(),
      bazzarName: json['bazzarName'] as String,
      bazzarAddress: json['bazzarAddress'] as String,
      bazzarMaximumCapacity: (json['bazzarMaximumCapacity'] as num).toDouble(),
      vendorRegisteredList: json['vendorRegisteredList'] as List<dynamic>,
      bazzarDate: json['bazzarDate'] as String,
      bazzarDescription: json['bazzarDescription'] as String,
      bazzarCity: json['bazzarCity'] as String,
    );

Map<String, dynamic> _$WeeklyBazzarModelToJson(WeeklyBazzarModel instance) =>
    <String, dynamic>{
      'bazzarId': instance.bazzarId,
      'vendorTypeFavourable': instance.vendorTypeFavourable,
      'bazzarImageUrl': instance.bazzarImageUrl,
      'bazzarLat': instance.bazzarLat,
      'bazzarLong': instance.bazzarLong,
      'bazzarName': instance.bazzarName,
      'bazzarAddress': instance.bazzarAddress,
      'bazzarMaximumCapacity': instance.bazzarMaximumCapacity,
      'vendorRegisteredList': instance.vendorRegisteredList,
      'bazzarDate': instance.bazzarDate,
      'bazzarDescription': instance.bazzarDescription,
      'bazzarCity': instance.bazzarCity,
    };
