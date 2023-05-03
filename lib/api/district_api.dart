import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/district_model.dart';
import '../state/district_state.dart';

Future<List<DistrictModel>> fetchDistrictsApi(String cityId) async {
  DistrictState districtState = Get.find<DistrictState>();
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('cities')
      .doc(cityId)
      .collection('districts')
      .get();

  List<DistrictModel> districts = snapshot.docs
      .map(
          (doc) => DistrictModel.fromJson({'id': doc.id, ...doc.data() as Map}))
      .toList();

  districtState.setDistricts = districts;

  return districts;
}
