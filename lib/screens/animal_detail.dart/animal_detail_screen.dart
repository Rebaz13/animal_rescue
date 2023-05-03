import 'dart:ui';

import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:rescue_animal/model/animal_modal.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AnimalDetailScreen extends StatelessWidget {
  AnimalModel animal;
  AnimalDetailScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      headerWidget: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(animal.image), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 0,
              child: Container(
                width: Get.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: Text(
                          animal.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: [
        SizedBox(
          width: Get.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'About',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.pets, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    '', //    animal.breed,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    animal.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.cake, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    '${animal.age} years old',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                animal.description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
      title: const Text('Animal Detail'),
    );
  }
}
