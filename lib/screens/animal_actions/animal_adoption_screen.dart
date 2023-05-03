import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rescue_animal/state/animals_state.dart';

import '../../api/anilams_api.dart';
import '../../tabs/home_tab.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<GetBuilder> _children = [
    GetBuilder<AnimalsState>(
      builder: (state) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: state.getAnimals.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 50,
            height: 50,
            child: Image.network(
              state.getAnimals[index].image,
            ),
          );
        },
      ),
    ),
    GetBuilder<AnimalsState>(
      builder: (state) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: state.getAnimals.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: 50,
            child: Image.network(
              state.getAnimals[index].image,
            ),
          );
        },
      ),
    ),
  ];
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    fetchAnimalsApi();
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: items),
    );
  }
}
