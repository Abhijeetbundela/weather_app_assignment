import 'package:get/get.dart';
import 'package:weather_app_assignment/network/network_apis.dart';

class AppBindings {
  static final bindings = [
    Bind.lazyPut(() => NetworkApis()),
  ];
}
