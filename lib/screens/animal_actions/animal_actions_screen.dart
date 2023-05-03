import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/model/missing_animal.dart';

import '../../utils/app_images.dart';
import '../missing_pet.dart';
import 'animal_adoption_screen.dart';

class AnimalActionsScreen extends StatefulWidget {
  const AnimalActionsScreen({super.key});

  @override
  State<AnimalActionsScreen> createState() => _AnimalActionsScreenState();
}

class _AnimalActionsScreenState extends State<AnimalActionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> actions = [
    {
      'title': 'find missing animal',
      'image': AppImages.action1,
      'route': MissingPetUi(),
    },
    {
      'title': 'report an animal',
      'image': AppImages.action3,
    },
    {
      'title': 'Adop an animal',
      'image': AppImages.action2,
      'route': MyHomePage(),
    },
    {
      'title': 'Add adopter',
      'image': 'assets/icons/add_adopter.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * 0.05),
          const Text(
            'Animal resuce',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: GestureDetector(
                            onTap: () {
                              Get.to(actions[index]['route']);
                            },
                            child: Container(
                              height: Get.height * 0.22,
                              width: Get.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(actions[index]['image']),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                      offset: const Offset(0, 1),
                                    ),
                                  ]),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                      width: Get.width * 1,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SvgPicture.network('',
                                              fit: BoxFit.contain))),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.85,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            actions[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
