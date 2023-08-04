import 'package:flutter/material.dart';
import 'package:weather_app_assignment/model/weather.dart';
import 'package:weather_app_assignment/res/strings.dart';

import 'weather_item.dart';

class WeatherWidget extends StatelessWidget {
  final Weather? weather;
  final String? selectedCity;
  final VoidCallback onClearTap;
  final RefreshCallback onRefresh;

  const WeatherWidget({
    super.key,
    required this.weather,
    required this.onClearTap,
    required this.onRefresh,
    this.selectedCity,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          children: [
            weather != null
                ? WeatherItem(
                    weather: weather!,
                    onClearTap: onClearTap,
                    selectedCity: selectedCity,
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3,
                    ),
                    child: Center(child: Text(Strings.noDataFound)),
                  ),
          ],
        ),
      ),
    );
  }
}
