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
  final String updated;
  final int maxTemp;
  final String description;

  CurrentWeather(
      {this.cityName,
      this.description,
      this.maxTemp,
      this.icon,
      this.temp,
      this.minTemp,
      this.windSpeed,
      this.pressure,
      this.humidity,
      this.visibility,
      this.sunrise,
      this.updated,
      this.sunset});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    int sunriseTimestamp = json['sys']['sunrise'];
    int sunsetTimestamp = json['sys']['sunset'];
    int updatedTimestamp = json['dt'];
    var sunrise = DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000));
    var sunset = DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000));

    var updated = DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(updatedTimestamp * 1000));

    return CurrentWeather(
        cityName: json['name'],
        icon: json['weather'][0]['icon'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'].round(),
        minTemp: json['main']['temp_min'].round(),
        maxTemp: json['main']['temp_max'].round(),
        windSpeed: json['wind']['speed'].round(),
        pressure: json['main']['pressure'].round(),
        humidity: json['main']['humidity'].round(),
        visibility: (json['visibility'] / 1000).round(),
        sunrise: sunrise,
        sunset: sunset,
        updated: updated);
  }
}
