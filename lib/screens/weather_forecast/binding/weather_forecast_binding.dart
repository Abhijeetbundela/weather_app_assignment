import 'package:get/get.dart';
import 'package:weather_app_assignment/screens/weather_forecast/controller/weather_forecast_controller.dart';

class WeatherForecastBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => WeatherForecastController()),
    ];
  }
}
