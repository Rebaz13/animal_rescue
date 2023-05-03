import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';

class topSwipeCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback navigate;
  topSwipeCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.navigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ]),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.orange,
                      Colors.orangeAccent,
                    ])),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image, fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: 80,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black.withOpacity(0.3), width: 0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              subtitle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            fixedSize: Size(100, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
