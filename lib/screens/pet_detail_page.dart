import 'dart:ui';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../utils/app_images.dart';

class PetDetialPage extends StatelessWidget {
  const PetDetialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableHome(
        title: Text('Pet Detail'),
        headerWidget: Container(
          child: Stack(
            children: [
              Positioned(
                child: buttonArrow(context),
              )
            ],
          ),
          color: Colors.red,
        ),
        body: [],
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            clipBehavior: Clip.hardEdge,
            height: 55,
            width: 55,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(24)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ))),
      ),
    );
  }
}
