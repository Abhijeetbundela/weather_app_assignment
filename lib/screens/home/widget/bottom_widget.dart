import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/res/strings.dart';
import 'package:weather_app_assignment/screens/weather_forecast/weather_forecast_screen.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(WeatherForecastScreen.route),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(Strings.view5Day),
      ),
    );
  }
}
