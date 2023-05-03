import 'package:get/get.dart';

import '../model/city_model.dart';

class CitiesState extends GetxController {
  List<CityModel> _cities = [];

  List<CityModel> get getCities => _cities; //getter

  set setCities(List<CityModel> cities) {
    _cities = cities;
    update();
  }
}
