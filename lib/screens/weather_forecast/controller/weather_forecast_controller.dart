import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_assignment/network/network_apis.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/date_time_utls.dart';
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
      var data =
          await _networkApis.weatherFactory.fiveDayForecastByCityName(city);

      weatherList.value = removeDuplicatesByDate(data);

      log('message ${weatherList.value.length}');
    } catch (e) {
      log('_getData $e');
    }
    this.isLoading(false);
  }

  List<Weather> removeDuplicatesByDate(List<Weather> itemList) {
    List<Weather> uniqueItems = [];
    Set<DateTime> uniqueDates = {};

    for (var item in itemList) {
      var date = dateFormat.parse(
        dateFormat.format(item.date ?? DateTime.now()),
      );
      if (!uniqueDates.contains(date)) {
        uniqueItems.add(item);
        uniqueDates.add(date);
      }
    }

    return uniqueItems;
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
