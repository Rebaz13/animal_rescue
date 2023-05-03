import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:rescue_animal/screens/shelter_admin/test.dart';
import 'package:rescue_animal/tabs/appointments_tab.dart';
import 'package:rescue_animal/tabs/home_tab.dart';
import 'package:rescue_animal/tabs/profile_tab.dart';

import '../screens/animal_actions/animal_actions_screen.dart';
import '../utils/app_texts.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentWidget = 0;
  List<TabItem> tabs = [
    TabItem(
      icon: IconlyBold.home,
      title: AppTexts.home.tr,
    ),
    TabItem(
      icon: IconlyBold.calendar,
      title: 'Add animal',
    ),
    const TabItem(
      icon: IconlyBold.calendar,
      title: ' Actions',
    ),
    TabItem(
      icon: IconlyBold.profile,
      title: AppTexts.profile.tr,
    )
  ];

  List<Widget> widgets = [
    HomePage(),
    const AnimalForm(),
    const AnimalActionsScreen(),
    const ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: widgets[currentWidget],
      bottomNavigationBar: BottomBarDivider(
        items: tabs,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        colorSelected: Theme.of(context).primaryColor,
        indexSelected: currentWidget,
        onTap: (index) => setState(() {
          currentWidget = index;
        }),
        styleDivider: StyleDivider.top,
      ),
    );
  }
}
