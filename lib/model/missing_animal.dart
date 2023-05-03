import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MissingAnimal {
  late String description;
  LatLng? latlng;
  XFile? image;
  MissingAnimal({
    required this.description,
    required this.latlng,
    required this.image,
  });
  MissingAnimal.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    latlng = json['latlng'];
    image = (json['image'] != null ? File(json['image']) : null) as XFile?;
  }
  Map<String, dynamic> toJson() => {
        'description': description,
        'latlng': GeoPoint(latlng!.latitude, latlng!.longitude),
        'image': image != null ? image!.path : null,
      };
}
