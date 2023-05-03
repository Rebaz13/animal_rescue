import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/api/anilams_api.dart';
import 'package:rescue_animal/state/animals_state.dart';

import '../screens/missing_pet.dart';
import '../utils/app_images.dart';
import '../widgets/home_page/adopt_card.dart';
import '../widgets/home_page/appbar.dart';
import '../widgets/home_page/categories.dart';
import '../widgets/home_page/drawer_widget.dart';
import '../widgets/home_page/topswipecard.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
// WRITE A CODE FOR HOME PAGE FLUTTER
  AnimalsState animalsState = Get.find<AnimalsState>();

  @override
  Widget build(BuildContext context) {
    fetchAnimalsApi();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Appbar(),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.2,
                width: Get.width * 1,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 1800),
                  ),
                  items: [
                    topSwipeCard(
                      image: AppImages.onboarding_one,
                      title: " Add animal for adoption",
                      subtitle: "Do you have a pet for adoption?",
                      navigate: () {
                        Get.to(MissingPetUi());
                      },
                    ),
                    topSwipeCard(
                      image: AppImages.missing_pet,
                      title: " have you lost your pet?",
                      subtitle: "share to find your pet",
                      navigate: () {
                        Get.to(MissingPetUi());
                      },
                    ),
                  ].map((widget) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(),
                          child: widget,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Center(child: const categoires()),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Adopt a pet",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              AdoptPetCart()
            ],
          ),
        ),
      ),
    );
  }
}
