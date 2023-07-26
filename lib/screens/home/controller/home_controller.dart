import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_assignment/network/network_apis.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/methods.dart';
import 'package:weather_app_assignment/utils/preferences_management.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isDarkTheme = false.obs;

  final _networkApis = Get.find<NetworkApis>();

  var searchEditTextController = TextEditingController();

  var selectedCity = Rxn<String>();
  var weather = Rxn<Weather>();

  @override
  void onReady() {
    super.onReady();

    isDarkTheme.value = PreferencesManagement.getBool(key: PMKeys.isDarkTheme);
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    _getData(defaultCity);
  }

  Future<void> onRefresh() async {
    await _getData(
      selectedCity.value ?? defaultCity,
      isLoading: false,
    );
  }

  Future<void> _getData(
    String city, {
    bool isLoading = true,
  }) async {
    this.isLoading(isLoading);
    try {
      var response =
          await _networkApis.weatherFactory.currentWeatherByCityName(city);
      weather.value = response;
    } catch (e) {
      log('_getData $e');
    }
    this.isLoading(false);
  }

  void onChanged(String value) {
    clearFocus();

    if (value.isNotEmpty) {
      weather.value = null;
      selectedCity(value);
      _getData(value);
    }
  }

  void onThemeChanged(bool value) {
    isDarkTheme.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    PreferencesManagement.saveBool(key: PMKeys.isDarkTheme, value: value);
  }

  void onClearTap() {
    selectedCity.value = null;
    searchEditTextController.text = "";
    _getData(selectedCity.value ?? defaultCity);
  }

  @override
  void onClose() {
    searchEditTextController.dispose();
    super.onClose();
  }
}
