import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../state/missing_animal_state.dart';
import '../model/missing_animal.dart';

Future<List<MissingAnimal>> fetchMisingAnimal() async {
  MissingAnimalState missingAnimalState = Get.find<MissingAnimalState>();

  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('missingPets').get();

  List<MissingAnimal> missings = snapshot.docs
      .map((document) => MissingAnimal.fromJson(
          {'id': document.id, ...document.data() as Map}))
      .toList();
  missingAnimalState.setMissingAnimal = missings;

  return missings;
}

Future addMissingAnimal({required data}) async {
  await FirebaseFirestore.instance.collection('missingPets').add(data);
  fetchMisingAnimal();
}
