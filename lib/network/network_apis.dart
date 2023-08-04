import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/model/weather_utils.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/date_time_utls.dart';

class NetworkApis extends GetConnect {
  static Future<bool> checkConnection() async {
    if (kIsWeb) return true;
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<Weather> currentWeatherByCityNameApi(String cityName) async {
    if (!await checkConnection()) {
      throw "No internet connection";
    }
    var url = "${baseUrl}weather";
    var query = {
      "q": cityName,
      "appid": apiKey,
    };
    var response = await get(url, query: query);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Weather(response.body);
    } else {
      if (response.body != null) {
        var errorResponse = response.body["message"];
        throw errorResponse;
      } else {
        throw "Something went wrong";
      }
    }
  }

  Future<List<Weather>> fiveDayForecastByCityNameApi(String cityName) async {
    if (!await checkConnection()) {
      throw "No internet connection";
    }
    var url = "${baseUrl}forecast";
    var query = {
      "q": cityName,
      "appid": apiKey,
    };
    var response = await get(url, query: query);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<Weather> forecasts = WeatherUtils.parseForecast(response.body);
      return _removeDuplicatesByDate(forecasts);
    } else {
      if (response.body != null) {
        var errorResponse = response.body["message"];
        throw errorResponse;
      } else {
        throw "Something went wrong";
      }
    }
  }

  List<Weather> _removeDuplicatesByDate(List<Weather> itemList) {
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
}
