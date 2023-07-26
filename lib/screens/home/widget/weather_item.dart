import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_assignment/res/consts.dart';
import 'package:weather_app_assignment/res/strings.dart';
import 'package:weather_app_assignment/utils/date_time_utls.dart';

import 'home_grid_widget.dart';

class WeatherItem extends StatelessWidget {
  final Weather weather;
  final String? selectedCity;
  final VoidCallback? onClearTap;

  const WeatherItem({
    super.key,
    required this.weather,
    this.selectedCity,
    this.onClearTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(getImageUrl(weather.weatherIcon ?? "")),
        if (selectedCity != null)
          InkWell(
            onTap: onClearTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey[400],
              ),
              child: Text(
                Strings.clear,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        Text(
          weather.weatherMain ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        Text(
          "${weather.areaName ?? ""}, ${weather.country ?? ""}",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        Text(
          '${weather.temperature?.celsius?.toStringAsFixed(2) ?? 0.0}° C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '${weather.tempMax?.celsius?.toStringAsFixed(2) ?? 0.0}° C / ${weather.tempMin?.celsius?.toStringAsFixed(2) ?? 0.0}° C',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.5,
            crossAxisCount: 2,
          ),
          children: [
            HomeGridWidget(
              title: Strings.humidity,
              value: '${weather.humidity ?? 0.0}%',
            ),
            HomeGridWidget(
              title: Strings.windSpeed,
              value: '${weather.windSpeed ?? 0.0} m/s',
            ),
            HomeGridWidget(
              title: Strings.pressure,
              value: '${weather.pressure ?? 0.0} hPa',
            ),
            HomeGridWidget(
              title: Strings.cloudiness,
              value: '${weather.cloudiness ?? 0.0}%',
            ),
            HomeGridWidget(
              title: Strings.sunrise,
              value: timeDisplayFormat.format(
                weather.sunrise ?? DateTime.now(),
              ),
            ),
            HomeGridWidget(
              title: Strings.sunset,
              value: timeDisplayFormat.format(
                weather.sunset ?? DateTime.now(),
              ),
            ),
            HomeGridWidget(
              title: Strings.feelsLike,
              value:
                  '${weather.tempFeelsLike?.celsius?.toStringAsFixed(2) ?? 0.0}',
            ),
          ],
        )
      ],
    );
  }
}
