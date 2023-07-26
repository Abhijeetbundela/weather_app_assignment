import 'package:weather_app_assignment/model/weather.dart';

class WeatherUtils {
  static int? Function(Map<String, dynamic>? M, String k) get unpackInt =>
      _unpackInt;

  static int? _unpackInt(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        final val = M[k];
        if (val is String) {
          return int.parse(val);
        } else if (val is int) {
          return val;
        }
        return -1;
      }
    }
    return null;
  }

  static double? Function(Map<String, dynamic>? M, String k) get unpackDouble =>
      _unpackDouble;

  static double? _unpackDouble(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        final val = M[k];
        if (val is String) {
          return double.parse(val);
        } else if (val is num) {
          return val.toDouble();
        }
      }
    }
    return null;
  }

  static String? Function(Map<String, dynamic>? M, String k) get unpackString =>
      _unpackString;

  static String? _unpackString(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        return M[k];
      }
    }
    return null;
  }

  static DateTime? Function(Map<String, dynamic>? M, String k) get unpackDate =>
      _unpackDate;

  static DateTime? _unpackDate(Map<String, dynamic>? M, String k) {
    if (M != null) {
      if (M.containsKey(k)) {
        int millis = M[k] * 1000;
        return DateTime.fromMillisecondsSinceEpoch(millis);
      }
    }
    return null;
  }

  static Temperature Function(Map<String, dynamic>? M, String k)
      get unpackTemperature => _unpackTemperature;

  static Temperature _unpackTemperature(Map<String, dynamic>? M, String k) {
    double? kelvin = _unpackDouble(M, k);
    return Temperature(kelvin);
  }

  static List<Weather> Function(Map<String, dynamic> jsonForecast)
      get parseForecast => _parseForecast;

  static List<Weather> _parseForecast(Map<String, dynamic> jsonForecast) {
    List<dynamic> forecastList = jsonForecast['list'];
    Map<String, dynamic> city = jsonForecast['city'];
    Map<String, dynamic>? coord = city['coord'];
    String? country = city['country'];
    String? name = _unpackString(city, 'name');
    double? lat = _unpackDouble(coord, 'lat');
    double? lon = _unpackDouble(coord, 'lon');

    // Convert the json list to a Weather list
    return forecastList.map((w) {
      // Put the general fields inside inside every weather object
      w['name'] = name;
      w['sys'] = {'country': country};
      w['coord'] = {'lat': lat, 'lon': lon};
      return Weather(w);
    }).toList();
  }
}
