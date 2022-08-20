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
      bazaarAddress: json['bazaarAddress'] as String,
      bazaarMaximumCapacity: (json['bazaarMaximumCapacity'] as num).toDouble(),
      vendorRegisteredList: (json['vendorRegisteredList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bazaarDate: json['bazaarDate'] as String,
      bazaarDescription: json['bazaarDescription'] as String,
      bazaarCity: json['bazaarCity'] as String,
    );

Map<String, dynamic> _$WeeklyBazzarModelToJson(WeeklyBazzarModel instance) =>
    <String, dynamic>{
      'bazzarId': instance.bazzarId,
      'vendorTypeFavourable': instance.vendorTypeFavourable,
      'bazzarImageUrl': instance.bazzarImageUrl,
      'bazzarLat': instance.bazzarLat,
      'bazzarLong': instance.bazzarLong,
      'bazzarName': instance.bazzarName,
      'bazaarAddress': instance.bazaarAddress,
      'bazaarMaximumCapacity': instance.bazaarMaximumCapacity,
      'vendorRegisteredList': instance.vendorRegisteredList,
      'bazaarDate': instance.bazaarDate,
      'bazaarDescription': instance.bazaarDescription,
      'bazaarCity': instance.bazaarCity,
    };
