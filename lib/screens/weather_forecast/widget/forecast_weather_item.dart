import 'package:flutter/material.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/screens/home/widget/weather_item.dart';
import 'package:weather_app_assignment/utils/date_time_utls.dart';

class ForecastWeatherItem extends StatelessWidget {
  final Weather weather;

  const ForecastWeatherItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 3,
      margin: EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Text(
              dayTimeDisplayFormat.format(weather.date ?? DateTime.now()),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            WeatherItem(weather: weather),
          ],
        ),
      ),
    );
  }
}
