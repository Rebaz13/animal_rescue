import 'package:rescue_animal/model/city_model.dart';
import 'package:rescue_animal/model/district_model.dart';
import 'package:rescue_animal/model/species_model.dart';

class AnimalModel {
  late String id;
  late String name; // textFormField

  late int age; //spin field
  late String image;
  late bool isVaccinated;
  late CityModel city; //collection
  late DistrictModel district;
  late SpeciesModel specie; //collection<->collection
  late String description;
  late bool isforAdoption;
  late bool isMissing = false;

  AnimalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    image = json['image'];
    isVaccinated = json['isVaccinated'];
    city = CityModel.fromJson(json['city']);
    specie = SpeciesModel.fromJson(json['breeds']);
    district = DistrictModel.fromJson(json['district']);
    description = json['description'];
    isforAdoption = json['isforAdoption'];
    isMissing = false;
    //json['isMissing'];
  }
}
