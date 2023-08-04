import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/network/network_apis.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/methods.dart';

class WeatherForecastController extends GetxController {
  var isLoading = true.obs;

  final _networkApis = Get.find<NetworkApis>();

  var searchEditTextController = TextEditingController();

  var weatherList = <Weather>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getData(defaultCity);
  }

  Future<void> _getData(
    String city, {
    bool isLoading = true,
  }) async {
    this.isLoading(isLoading);
    try {
      weatherList.value = await _networkApis.fiveDayForecastByCityNameApi(city);
    } catch (e) {
      log('_getData $e');
      showToast('$e');
    }
    this.isLoading(false);
  }

  void onChanged(String value) {
    clearFocus();
    if (value.isNotEmpty) {
      _getData(value);
    }
  }

  @override
  void onClose() {
    searchEditTextController.dispose();
    super.onClose();
  }
}
