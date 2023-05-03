import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/screens/animal_detail.dart/animal_detail_screen.dart';
import 'package:rescue_animal/state/animals_state.dart';
import '../../api/anilams_api.dart';

AnimalsState animalsState = Get.find<AnimalsState>();

class AdoptPetCart extends StatefulWidget {
  const AdoptPetCart({
    super.key,
  });

  @override
  State<AdoptPetCart> createState() => _AdoptPetCartState();
}

class _AdoptPetCartState extends State<AdoptPetCart> {
  var listScrollController = ScrollController();
  bool currentState = false;
  var scrolDirection = ScrollDirection.idle;
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrolDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: GetBuilder<AnimalsState>(
        builder: (state) => NotificationListener<ScrollNotification>(
          onNotification: _scrollnotfication,
          child: ListView.builder(
            controller: listScrollController,
            itemCount: state.getAnimals.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => AnimalDetailScreen(
                        animal: state.getAnimals[index],
                      )),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.rotationZ(
                        scrolDirection == ScrollDirection.forward
                            ? 0.07
                            : scrolDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    height: 310,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          state.getAnimals[index].image != null
                              ? state.getAnimals[index].image
                              : "assets/images/animal.png",
                          fit: BoxFit.cover,
                          height: 310,
                          width: 240,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            // color: Color.fromARGB(100, 0, 0, 0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      state.getAnimals[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentState = !currentState;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 30,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(6),
                                              bottomRight: Radius.circular(6)),
                                          color: !currentState
                                              ? Theme.of(context).primaryColor
                                              : Colors.pink),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Owner_notSet',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.getAnimals[index].city ==
                                                      null
                                                  ? "Slemani"
                                                  : state.getAnimals[index].city
                                                      .name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _scrollnotfication(ScrollNotification notification) {
    if (notification is ScrollEndNotification)
      setState(() {
        scrolDirection = ScrollDirection.idle;
      });
    return true;
  }
}
