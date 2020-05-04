import 'package:intl/intl.dart';

class CurrentWeather {
  final String cityName;
  final String icon;
  final int temp;
  final int minTemp;
  final int windSpeed;
  final int pressure;
  final int humidity;
  final int visibility;
  final String sunrise;
  final String sunset;

  CurrentWeather(
      {this.cityName,
      this.icon,
      this.temp,
      this.minTemp,
      this.windSpeed,
      this.pressure,
      this.humidity,
      this.visibility,
      this.sunrise,
      this.sunset});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    var sunriseTimestamp = json['sys']['sunrise'];
    var sunsetTimestamp = json['sys']['sunset'];
    var sunrise = DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000));
    var sunset = DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000));

    return CurrentWeather(
      cityName: json['name'],
      icon: json['weather'][0]['icon'],
      temp: json['main']['temp'].round(),
      minTemp: json['main']['temp_min'].round(),
      windSpeed: json['wind']['speed'].round(),
      pressure: json['main']['pressure'].round(),
      humidity: json['main']['humidity'].round(),
      visibility: (json['visibility'] / 1000).round(),
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
