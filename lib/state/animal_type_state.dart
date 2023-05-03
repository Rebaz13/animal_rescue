import 'package:get/get.dart';
import '../model/animal_type_model.dart';

class AnimalTypeState extends GetxController {
  List<AnimalTypeModel> _animalType = [];

  List<AnimalTypeModel> get getAnimalType => _animalType;

  set setAnimalType(List<AnimalTypeModel> type) {
    _animalType = type;
    update();
  }
}
