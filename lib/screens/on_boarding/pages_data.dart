import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/model/onboard_model.dart';

class OnboardPagesData extends StatelessWidget {
  final OnBoardModel data;
  const OnboardPagesData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.abc_rounded, size: 100),
        Image.asset(
          data.image,
          height: Get.height * 0.35,
        ),
        const SizedBox(height: 30),
        Text(
          data.bodyTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
