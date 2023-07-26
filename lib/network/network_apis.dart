import 'package:weather/weather.dart';
import 'package:weather_app_assignment/res/consts.dart';

class NetworkApis {
  final _weatherFactory = WeatherFactory(apiKey);

  Future<Weather> currentWeatherByCityName(String cityName) async {
    return await _weatherFactory.currentWeatherByCityName(cityName);
  }

  Future<List<Weather>> fiveDayForecastByCityName(String cityName) async {
    return await _weatherFactory.fiveDayForecastByCityName(cityName);
  }
}
