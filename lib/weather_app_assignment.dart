import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/controller/theme_controller.dart';

import 'bindings/app_bindings.dart';
import 'res/strings.dart';
import 'routes/app_pages.dart';

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

class WeatherAppAssignment extends StatelessWidget {
  const WeatherAppAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: themeController.getThemeMode,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      binds: AppBindings.bindings,
      title: Strings.appName,
      getPages: AppPages.pages,
    );
  }
}
