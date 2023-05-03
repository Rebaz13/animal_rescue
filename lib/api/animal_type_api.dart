import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/state/animal_type_state.dart';

import '../model/animal_type_model.dart';

Future<List<AnimalTypeModel>> fetchAnimalTypeApi() async {
  AnimalTypeState typeState = Get.find<AnimalTypeState>();
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("types").get();

  List<AnimalTypeModel> types = snapshot.docs
      .map((doc) =>
          AnimalTypeModel.fromJson({'id': doc.id, ...doc.data() as Map}))
      .toList();

  typeState.setAnimalType = types;

  return types;
}
