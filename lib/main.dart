import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/model/onboard_model.dart';
import 'package:rescue_animal/screens/on_boarding/onboardingScreen.dart';
import 'package:rescue_animal/state/animal_type_state.dart';
import 'package:rescue_animal/state/animals_state.dart';
import 'package:rescue_animal/state/specie_state.dart';
import 'package:rescue_animal/widgets/navbar.dart';

import 'firebase_options.dart';
import 'services/light_theme.dart';
import 'state/cities_api.dart';
import 'state/district_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AnimalsState());
    Get.put(CitiesState());
    Get.put(DistrictState());
    Get.put(AnimalTypeState());
    Get.put(SpecieState());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: lightTheme(),
      home: const OnboardingScreen(),
    );
  }
}
