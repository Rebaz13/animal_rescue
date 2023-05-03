import 'package:get/get.dart';
import 'package:rescue_animal/model/animal_modal.dart';

class AnimalsState extends GetxController {
  List<AnimalModel> _animals = [];

  List<AnimalModel> get getAnimals => _animals; //getter

  set setAnimals(List<AnimalModel> animals) {
    _animals = animals;
    update();
  }
}
