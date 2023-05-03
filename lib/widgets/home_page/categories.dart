import 'package:flutter/material.dart';
import 'package:rescue_animal/screens/pet_detail_page.dart';
import 'package:rescue_animal/utils/app_images.dart';
import 'package:get/get.dart';

List<String> images = [
  AppImages.cat1,
  AppImages.cat2,
  AppImages.cat3,
  AppImages.cat4,
  AppImages.cat4,
];

Widget items(String image) {
  return GestureDetector(
    onTap: () {
      Get.to(PetDetialPage());
    },
    child: Container(
      margin: EdgeInsets.all(10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class categoires extends StatelessWidget {
  const categoires({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return items(images[index]);
          }),
    );
  }
}
