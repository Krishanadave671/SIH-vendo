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
  String bazaarAddress;
  double bazaarMaximumCapacity;
  List<String> vendorRegisteredList;
  String bazaarDate;
  String bazaarDescription;
  String bazaarCity;

  WeeklyBazzarModel({
    required this.bazzarId,
    required this.vendorTypeFavourable,
    required this.bazzarImageUrl,
    required this.bazzarLat,
    required this.bazzarLong,
    required this.bazzarName,
    required this.bazaarAddress,
    required this.bazaarMaximumCapacity,
    required this.vendorRegisteredList,
    required this.bazaarDate,
    required this.bazaarDescription,
    required this.bazaarCity,
  });

  factory WeeklyBazzarModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBazzarModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyBazzarModelToJson(this);
}
