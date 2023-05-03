// ignore_for_file: prefer_const_constructors

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return FlexThemeData.light(
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 250, 130, 76),
      secondary: Color(0xff89d1c8),
      error: Color(0xffcf6679),
    ),
    blendLevel: 5,
    fontFamily: "gordita",
    appBarElevation: 0,
    tabBarStyle: FlexTabBarStyle.flutterDefault,
    tooltipsMatchBackground: true,
    appBarStyle: FlexAppBarStyle.surface,
    swapColors: false,
    lightIsWhite: true,
    useMaterial3: true,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: false,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 0.95,
        navigationBarOpacity: 0.95,
        inputDecoratorRadius: 15,
        elevatedButtonRadius: 15,
        outlinedButtonRadius: 15,
        textButtonRadius: 15,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: true,
        blendOnColors: true,
        blendTextTheme: true,
        bottomSheetRadius: 30),
  );
}
