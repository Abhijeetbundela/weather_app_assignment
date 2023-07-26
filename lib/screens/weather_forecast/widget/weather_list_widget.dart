import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_assignment/res/strings.dart';

import 'forecast_weather_item.dart';

class WeatherListWidget extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherListWidget({
    Key? key,
    required this.weatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weatherList.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width / 3,
        ),
        child: Text(Strings.noDataFound),
      );
    }
    return ListView.builder(
      itemCount: weatherList.length,
      itemBuilder: (context, index) {
        var weather = weatherList[index];
        return ForecastWeatherItem(weather: weather);
      },
    );
  }
}
