import 'package:flutter/material.dart';

class SpeciesModel {
  String? id;
  late String breed;

  SpeciesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['breed'] = breed;
    return data;
  }
}
