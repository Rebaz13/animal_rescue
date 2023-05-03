import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/state/cities_api.dart';

import '../model/city_model.dart';

Future<List<CityModel>> fetchCitiesApi() async {
  CitiesState citiesState = Get.find<CitiesState>();
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("cities").get();

  List<CityModel> cities = snapshot.docs
      .map((doc) => CityModel.fromJson({'id': doc.id, ...doc.data() as Map}))
      .toList();

  citiesState.setCities = cities;

  return cities;
}
