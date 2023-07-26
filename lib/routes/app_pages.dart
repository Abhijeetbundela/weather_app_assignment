import 'package:get/get.dart';
import 'package:weather_app_assignment/screens/home/binding/home_binding.dart';
import 'package:weather_app_assignment/screens/home/home_screen.dart';
import 'package:weather_app_assignment/screens/weather_forecast/binding/weather_forecast_binding.dart';
import 'package:weather_app_assignment/screens/weather_forecast/weather_forecast_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: HomeScreen.route,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: WeatherForecastScreen.route,
      page: () => WeatherForecastScreen(),
      binding: WeatherForecastBinding(),
    ),
  ];
}
