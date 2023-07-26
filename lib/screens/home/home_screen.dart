import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/res/strings.dart';

import 'controller/home_controller.dart';
import 'widget/bottom_widget.dart';
import 'widget/search_widget.dart';
import 'widget/weather_widget.dart';

class HomeScreen extends GetView<HomeController> {
  static const String route = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        centerTitle: true,
        actions: [
          Obx(() {
            return Switch(
              value: controller.isDarkTheme.value,
              onChanged: controller.onThemeChanged,
            );
          }),
        ],
      ),
      body: Obx(() {
        var isLoading = controller.isLoading.value;
        // var weatherData = controller.weatherData.value;
        // var cityData = controller.cityData.value;
        var weather = controller.weather.value;
        if (isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SearchWidget(
                textEditingController: controller.searchEditTextController,
                onChanged: controller.onChanged,
              ),
              // if (weatherData != null && weather != null && cityData != null)
              if (weather != null)
                WeatherWidget(
                  weather: weather,
                  // weatherData: weatherData,
                  // cityData: cityData,
                  selectedCity: controller.selectedCity.value,
                  onClearTap: controller.onClearTap,
                  onRefresh: controller.onRefresh,
                ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomWidget(),
    );
  }
}
