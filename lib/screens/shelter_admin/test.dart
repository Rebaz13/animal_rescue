import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rescue_animal/api/cities_api.dart';
import 'package:rescue_animal/api/specie_api.dart';
import 'package:rescue_animal/state/specie_state.dart';

import '../../api/anilams_api.dart';
import '../../api/district_api.dart';
import '../../model/city_model.dart';
import '../../model/district_model.dart';
import '../../state/cities_api.dart';
import '../../state/district_state.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_texts.dart';
import '../../widgets/map_widget.dart';
import '../../model/animal_type_model.dart';
import '../../state/animal_type_state.dart';
import '../../api/animal_type_api.dart';

class AnimalForm extends StatefulWidget {
  const AnimalForm({super.key});

  @override
  _AnimalFormState createState() => _AnimalFormState();
}

final nameController = TextEditingController();
final description = TextEditingController();
final ageController = TextEditingController();
final imageUrlContrloller = TextEditingController();

String? _currentSelectedCityValue;
String? _currentSelectedDistrictValue;
String? _currentAnimalType;
String? _currentBreedType;
bool? foradoption;
String? _dropDownValue;

XFile? _selectedImage;
bool isForAdaption = true;
bool isVaccinated = true;
LatLng? _currentLocation;

final DistrictState districtState = Get.find<DistrictState>();
final CitiesState citiesState = Get.find<CitiesState>();

@override
void initState() {}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fetchCitiesApi();
    fetchAnimalTypeApi();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Add New Animal')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();

                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 80);

                            if (image != null) {
                              setState(() {
                                _selectedImage = image;
                              });
                            }
                          },
                          child: _selectedImage == null
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Theme.of(context).disabledColor,
                                      )),
                                  child: const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(
                                            File(_selectedImage!.path)),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                )),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            labelText: 'Name', hintText: 'Enter animal name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter animal name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: description,
                        decoration: const InputDecoration(
                            labelText: 'description',
                            hintText: 'Enter animal description'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter animal description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(
                            labelText: 'Age', hintText: 'Enter animal age'),
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter animal age';
                          }
                          return null;
                        },
                      ),
                      // GetBuilder<AnimalTypeState>(builder: (state) {
                      //   return ListView.builder(
                      //       itemCount: state.getAnimalType.length,
                      //       itemBuilder: (context, index) {
                      //         Text(state.getAnimalType[index].type);
                      //       });
                      // }),
                      const SizedBox(height: 16),
                      _buildCityFromField(),
                      const SizedBox(height: 16),
                      _buildDistrictFromField(),
                      const SizedBox(height: 16),
                      _buildTypeFromField(),
                      const SizedBox(height: 16),
                      _buildSpecieFromField(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Is for Adoption',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                          const Spacer(),
                          Switch(
                            value: isForAdaption,
                            onChanged: (value) {
                              setState(() {
                                isForAdaption = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Is Vaccinated',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                          const Spacer(),
                          Switch(
                            value: isVaccinated,
                            onChanged: (value) {
                              setState(() {
                                isVaccinated = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'location',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Please select the location of the animal',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 16),
                          MapWidget(
                            onLatChange: (LatLng latlng) {
                              _currentLocation = latlng;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: Get.width,
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            onPressed: () async {
                              if (_selectedImage == null) {
                                Get.snackbar(
                                  "Failed",
                                  "Please select an image",
                                );
                                return;
                              }

                              if (_formKey.currentState!.validate()) {
                                Map<String, dynamic> breed = {
                                  'id': '',
                                  'breed': _currentAnimalType,
                                };
                                print('validated');
                                CityModel? city = citiesState.getCities
                                    .firstWhereOrNull((element) =>
                                        element.id ==
                                        _currentSelectedCityValue);

                                DistrictModel? district = districtState
                                    .getDistricts
                                    .firstWhereOrNull((element) =>
                                        element.id ==
                                        _currentSelectedDistrictValue);
                                Map<String, dynamic> data = {
                                  'name': nameController.text,
                                  'description': description.text,
                                  'age': int.parse(ageController.text),
                                  'isVaccinated': isVaccinated,
                                  'isforAdoption': isForAdaption,
                                  'breed': breed,
                                  'image': _selectedImage,
                                  'latlng': GeoPoint(_currentLocation!.latitude,
                                      _currentLocation!.longitude),
                                  'district': district!.toJson(),
                                  'city': city!.toJson(),
                                };

                                bool result = await addAnimalApi(data: data);
                                if (result) {
                                  // Get.back();
                                  Get.snackbar(
                                    "Added",
                                    "added successfully",
                                  );

                                  nameController.clear();
                                  ageController.clear();
                                  description.clear();
                                  _selectedImage = XFile('');
                                } else {
                                  Get.snackbar(
                                    "Failed",
                                    "Failed",
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCityFromField() {
    return GetBuilder<CitiesState>(
        builder: (_) => DropdownButtonFormField<String>(
              menuMaxHeight: Get.height * 0.5,
              icon: SvgPicture.asset(
                AppIcons.dropDown,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              iconSize: 20,
              hint: Text(AppTexts.selectCity.tr),
              value: _currentSelectedCityValue,
              isDense: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppTexts.selectCity.tr;
                }
                return null;
              },
              onChanged: (String? newValue) {
                _currentSelectedCityValue = newValue;
                fetchDistrictsApi(newValue!);
              },
              items: _.getCities.isEmpty
                  ? [
                      const DropdownMenuItem<String>(
                        value: null,
                        child: Text('Select city'),
                      )
                    ]
                  : _.getCities.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id,
                        child: Text(value.name),
                      );
                    }).toList(),
            ));
  }

  _buildDistrictFromField() {
    return GetBuilder<DistrictState>(
        builder: (_) => DropdownButtonFormField<String>(
              menuMaxHeight: Get.height * 0.5,
              icon: SvgPicture.asset(
                AppIcons.dropDown,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              iconSize: 20,
              validator: (value) {
                return null;
              },
              hint: Text(AppTexts.selectDistrict.tr),
              value: _currentSelectedDistrictValue,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentSelectedDistrictValue = newValue;
                });
              },
              items: _.getDistricts.map((value) {
                return DropdownMenuItem<String>(
                  value: value.id,
                  child: Text(value.name),
                );
              }).toList(),
            ));
  }

  _buildTypeFromField() {
    return GetBuilder<AnimalTypeState>(
        builder: (_) => DropdownButtonFormField<String>(
              menuMaxHeight: Get.height * 0.5,
              icon: SvgPicture.asset(
                AppIcons.dropDown,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              iconSize: 20,
              hint: Text('select Animal Type'),
              value: _currentAnimalType,
              isDense: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select Animal Type';
                }
                return null;
              },
              onChanged: (String? newValue) {
                _currentAnimalType = newValue;
                fetchSpecieApi(newValue!);
              },
              items: _.getAnimalType.isEmpty
                  ? [
                      const DropdownMenuItem<String>(
                        value: null,
                        child: Text('Select Animal'),
                      )
                    ]
                  : _.getAnimalType.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id,
                        child: Text(value.type),
                      );
                    }).toList(),
            ));
  }

  _buildSpecieFromField() {
    return GetBuilder<SpecieState>(
        builder: (_) => DropdownButtonFormField<String>(
              menuMaxHeight: Get.height * 0.5,
              icon: SvgPicture.asset(
                AppIcons.dropDown,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              iconSize: 20,
              validator: (value) {
                return null;
              },
              hint: Text('Specie'),
              value: _currentBreedType,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentBreedType = newValue;
                });
              },
              items: _.species.map((value) {
                return DropdownMenuItem<String>(
                  value: value.id,
                  child: Text(value.breed),
                );
              }).toList(),
            ));
  }
}
