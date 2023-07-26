import 'package:weather/weather.dart';
import 'package:weather_app_assignment/res/consts.dart';

class NetworkApis {
  WeatherFactory get weatherFactory => WeatherFactory(apiKey);
}
