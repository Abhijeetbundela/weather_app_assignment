import 'package:weather_app_assignment/model/weather_utils.dart';

class Temperature {
  final double? _kelvin;

  Temperature(this._kelvin);

  double? get kelvin => _kelvin;

  double? get celsius => _kelvin != null ? _kelvin! - 273.15 : null;

  double? get fahrenheit =>
      _kelvin != null ? _kelvin! * (9 / 5) - 459.67 : null;

  @override
  String toString() => celsius != null
      ? '${celsius!.toStringAsFixed(1)} Celsius'
      : "No temperature";
}

class Weather {
  String? _country, _areaName, _weatherMain, _weatherDescription, _weatherIcon;
  Temperature? _temperature, _tempMin, _tempMax, _tempFeelsLike;
  Map<String, dynamic>? _weatherData;

  DateTime? _date, _sunrise, _sunset;
  double? _latitude,
      _longitude,
      _pressure,
      _windSpeed,
      _windDegree,
      _windGust,
      _humidity,
      _cloudiness,
      _rainLastHour,
      _rainLast3Hours,
      _snowLastHour,
      _snowLast3Hours;

  int? _weatherConditionCode;

  Weather(Map<String, dynamic> jsonData) {
    Map<String, dynamic>? main = jsonData['main'];
    Map<String, dynamic>? coord = jsonData['coord'];
    Map<String, dynamic>? sys = jsonData['sys'];
    Map<String, dynamic>? wind = jsonData['wind'];
    Map<String, dynamic>? clouds = jsonData['clouds'];
    Map<String, dynamic>? rain = jsonData['rain'];
    Map<String, dynamic>? snow = jsonData['snow'];
    Map<String, dynamic>? weather = jsonData['weather'][0];

    _latitude = WeatherUtils.unpackDouble(coord, 'lat');
    _longitude = WeatherUtils.unpackDouble(coord, 'lon');

    _country = WeatherUtils.unpackString(sys, 'country');
    _sunrise = WeatherUtils.unpackDate(sys, 'sunrise');
    _sunset = WeatherUtils.unpackDate(sys, 'sunset');

    _weatherData = jsonData;
    _weatherMain = WeatherUtils.unpackString(weather, 'main');
    _weatherDescription = WeatherUtils.unpackString(weather, 'description');
    _weatherIcon = WeatherUtils.unpackString(weather, 'icon');
    _weatherConditionCode = WeatherUtils.unpackInt(weather, 'id');

    _temperature = WeatherUtils.unpackTemperature(main, 'temp');
    _tempMin = WeatherUtils.unpackTemperature(main, 'temp_min');
    _tempMax = WeatherUtils.unpackTemperature(main, 'temp_max');
    _tempFeelsLike = WeatherUtils.unpackTemperature(main, 'feels_like');

    _humidity = WeatherUtils.unpackDouble(main, 'humidity');
    _pressure = WeatherUtils.unpackDouble(main, 'pressure');

    _windSpeed = WeatherUtils.unpackDouble(wind, 'speed');
    _windDegree = WeatherUtils.unpackDouble(wind, 'deg');
    _windGust = WeatherUtils.unpackDouble(wind, 'gust');

    _cloudiness = WeatherUtils.unpackDouble(clouds, 'all');

    _rainLastHour = WeatherUtils.unpackDouble(rain, '1h');
    _rainLast3Hours = WeatherUtils.unpackDouble(rain, '3h');

    _snowLastHour = WeatherUtils.unpackDouble(snow, '1h');
    _snowLast3Hours = WeatherUtils.unpackDouble(snow, '3h');

    _areaName = WeatherUtils.unpackString(jsonData, 'name');
    _date = WeatherUtils.unpackDate(jsonData, 'dt');
  }

  Map<String, dynamic>? toJson() => _weatherData;

  @override
  String toString() {
    return '''
    Place Name: $_areaName [$_country] ($latitude, $longitude)
    Date: $_date
    Weather: $_weatherMain, $_weatherDescription
    Temp: $_temperature, Temp (min): $_tempMin, Temp (max): $_tempMax,  Temp (feels like): $_tempFeelsLike
    Sunrise: $_sunrise, Sunset: $_sunset
    Wind: speed $_windSpeed, degree: $_windDegree, gust $_windGust
    Weather Condition code: $_weatherConditionCode
    ''';
  }

  String? get weatherDescription => _weatherDescription;

  String? get weatherMain => _weatherMain;

  String? get weatherIcon => _weatherIcon;

  int? get weatherConditionCode => _weatherConditionCode;

  double? get cloudiness => _cloudiness;

  double? get windDegree => _windDegree;

  double? get windSpeed => _windSpeed;

  double? get windGust => _windGust;

  Temperature? get tempMax => _tempMax;

  Temperature? get tempMin => _tempMin;

  Temperature? get temperature => _temperature;

  Temperature? get tempFeelsLike => _tempFeelsLike;

  double? get pressure => _pressure;

  double? get humidity => _humidity;

  double? get longitude => _longitude;

  double? get latitude => _latitude;

  DateTime? get date => _date;

  DateTime? get sunset => _sunset;

  DateTime? get sunrise => _sunrise;

  String? get areaName => _areaName;

  String? get country => _country;

  double? get rainLastHour => _rainLastHour;

  double? get rainLast3Hours => _rainLast3Hours;

  double? get snowLastHour => _snowLastHour;

  double? get snowLast3Hours => _snowLast3Hours;
}
