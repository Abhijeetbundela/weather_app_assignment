import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/controller/theme_controller.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/network/network_apis.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/methods.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isDarkTheme = false.obs;

  final _networkApis = Get.find<NetworkApis>();
  final _themeController = Get.find<ThemeController>();

  var searchEditTextController = TextEditingController();

  var selectedCity = Rxn<String>();
  var weather = Rxn<Weather>();

  @override
  void onReady() {
    super.onReady();

    isDarkTheme.value = _themeController.isDarkTheme;

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
      weather.value = await _networkApis.currentWeatherByCityNameApi(city);
    } catch (e) {
      log('_getData $e');
      showToast('$e');
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
    _themeController.changeTheme(value);
    isDarkTheme.value = _themeController.isDarkTheme;
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
