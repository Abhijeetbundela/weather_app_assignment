import 'package:get/get.dart';
import 'package:weather_app_assignment/screens/home/controller/home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => HomeController()),
    ];
  }
}
