import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/utils/preferences_management.dart';

class ThemeController extends GetxController {
  late bool isDarkTheme;

  @override
  void onInit() {
    super.onInit();
    isDarkTheme = _getTheme();
  }

  ThemeMode get getThemeMode => _getTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _getTheme() {
    return PreferencesManagement.getBool(key: PMKeys.isDarkTheme);
  }

  void _updateDB(bool value) {
    PreferencesManagement.saveBool(
      key: PMKeys.isDarkTheme,
      value: value,
    );
  }

  void changeTheme(bool value) {
    isDarkTheme = value;
    _updateDB(isDarkTheme);
    _changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);
  }

  void _changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
