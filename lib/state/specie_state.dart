import 'package:get/get.dart';

import '../model/species_model.dart';

class SpecieState extends GetxController {
  List<SpeciesModel> _species = [];

  List<SpeciesModel> get species => _species; //getter

  set setSpecie(List<SpeciesModel> specie) {
    _species = specie;
    update();
  }
}
