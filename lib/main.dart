import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'weather_app_assignment.dart';

void main() async {
  await GetStorage.init();
  runApp(const WeatherAppAssignment());
}
