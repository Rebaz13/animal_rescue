import 'package:get/get.dart';

import '../model/district_model.dart';

class DistrictState extends GetxController {
  List<DistrictModel> _district = [];

  List<DistrictModel> get getDistricts => _district; //getter

  set setDistricts(List<DistrictModel> district) {
    _district = district;
    update();
  }
}
