import 'package:get/get.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/model/weather_utils.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/utils/date_time_utls.dart';

class NetworkApis extends GetConnect {
  // final _weatherFactory = WeatherFactory(apiKey);
  //
  // Future<Weather> currentWeatherByCityName(String cityName) async {
  //   return await _weatherFactory.currentWeatherByCityName(cityName);
  // }
  //
  // Future<List<Weather>> fiveDayForecastByCityName(String cityName) async {
  //   return await _weatherFactory.fiveDayForecastByCityName(cityName);
  // }

  Future<Weather?> currentWeatherByCityNameApi(String cityName) async {
    var url = "${baseUrl}weather";
    var query = {
      "q": cityName,
      "appid": apiKey,
    };
    var response = await get(url, query: query);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Weather(response.body);
    } else {
      var errorResponse = response.body["message"];
      throw errorResponse;
    }
  }

  Future<List<Weather>> fiveDayForecastByCityNameApi(String cityName) async {
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
      var errorResponse = response.body["message"];
      throw errorResponse;
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
