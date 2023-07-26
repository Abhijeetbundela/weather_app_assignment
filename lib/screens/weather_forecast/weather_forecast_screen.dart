import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_assignment/res/strings.dart';
import 'package:weather_app_assignment/screens/home/widget/search_widget.dart';

import 'controller/weather_forecast_controller.dart';
import 'widget/weather_list_widget.dart';

class WeatherForecastScreen extends GetView<WeatherForecastController> {
  static const String route = "/weatherForecastScreen";

  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.view5Day),
        centerTitle: true,
      ),
      body: Obx(() {
        var isLoading = controller.isLoading.value;
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
              SizedBox(height: 16),
              Flexible(
                child: WeatherListWidget(
                  weatherList: controller.weatherList.value,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
