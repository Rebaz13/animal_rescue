import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rescue_animal/model/animal_modal.dart';
import 'package:rescue_animal/state/animals_state.dart';

Future<List<AnimalModel>> fetchAnimalsApi() async {
  AnimalsState animalsState = Get.find<AnimalsState>();
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("animals").get();

  List<AnimalModel> animals = snapshot.docs
      .map((doc) => AnimalModel.fromJson({'id': doc.id, ...doc.data() as Map}))
      .toList();

  animalsState.setAnimals = animals;

  return animals;
}

Future<bool> addAnimalApi({required data}) async {
  XFile image = data['image'];

  if (image.path != "") {
    data['image'] = await uploadAnimalImageApi(image: image);
  } else {
    data['image'] = '';
  }
  try {
    await FirebaseFirestore.instance.collection('animals').add(data);
    fetchAnimalsApi();
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}

Future<String> uploadAnimalImageApi({required XFile image}) async {
  // Generate a random number between 1 and 1000
  int randomNumber = Random().nextInt(1000) + 1;

  firebase_storage.TaskSnapshot ref = await firebase_storage
      .FirebaseStorage.instance
      .ref('animals/$randomNumber.png')
      .putFile(File(image.path));

  String url = await ref.ref.getDownloadURL();

  return url;
}
