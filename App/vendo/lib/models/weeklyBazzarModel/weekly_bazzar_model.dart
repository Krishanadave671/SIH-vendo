import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'weekly_bazzar_model.g.dart';

@JsonSerializable()
class WeeklyBazzarModel {
  String bazzarId;
  List<String> vendorTypeFavourable;
  String bazzarImageUrl;
  double bazzarLat;
  double bazzarLong;
  String bazzarName;
  String bazzarAddress;
  double bazzarMaximumCapacity;
  List<dynamic> vendorRegisteredList;
  String bazzarDate;
  String bazzarDescription;
  String bazzarCity;

  WeeklyBazzarModel({
    required this.bazzarId,
    required this.vendorTypeFavourable,
    required this.bazzarImageUrl,
    required this.bazzarLat,
    required this.bazzarLong,
    required this.bazzarName,
    required this.bazzarAddress,
    required this.bazzarMaximumCapacity,
    required this.vendorRegisteredList,
    required this.bazzarDate,
    required this.bazzarDescription,
    required this.bazzarCity,
  });

  factory WeeklyBazzarModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBazzarModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyBazzarModelToJson(this);
}
