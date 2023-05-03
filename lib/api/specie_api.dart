import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/species_model.dart';
import '../state/specie_state.dart';

Future<List<SpeciesModel>> fetchSpecieApi(String typeId) async {
  SpecieState specieState = Get.find<SpecieState>();
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('types')
      .doc(typeId)
      .collection('species')
      .get();

  List<SpeciesModel> specieList = snapshot.docs
      .map((doc) => SpeciesModel.fromJson({'id': doc.id, ...doc.data() as Map}))
      .toList();

  specieState.setSpecie = specieList;

  return specieList;
}
