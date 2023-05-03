import 'package:get/get.dart';
import '../model/missing_animal.dart';

class MissingAnimalState extends GetxController {
  List<MissingAnimal> _missingPet = [];

  List<MissingAnimal> get getMissingPet => _missingPet;

  set setMissingAnimal(List<MissingAnimal> missings) {
    _missingPet = missings;
    update();
  }
}
