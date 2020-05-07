import 'package:charcode/charcode.dart';
import 'package:intl/intl.dart';

class CurrentWeather {
  final String cityName;
  final String icon;
  final int temp;
  final int maxTemp;
  final int minTemp;
  final int windSpeed;
  final int pressure;
  final int humidity;
  final int visibility;
  final int sunrise;
  final int sunset;
  final int updated;
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
    int visibility = json['visibility'];
    if (visibility != null) (visibility / 1000).round();

    int minTemp = json['main']['temp_min'].round();

    int temp = json['main']['temp'].round();

    int maxTemp = json['main']['temp_max'].round();

    int pressure = json['main']['pressure'].round();

    int humidity = json['main']['humidity'].round();

    int windSpeed = json['wind']['speed'].round();

    return CurrentWeather(
        cityName: json['name'],
        icon: json['weather'][0]['icon'],
        description: json['weather'][0]['description'],
        temp: temp,
        minTemp: minTemp,
        maxTemp: maxTemp,
        windSpeed: windSpeed,
        pressure: pressure,
        humidity: humidity,
        visibility: visibility,
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        updated: json['dt']);
  }

  String getTime(String key) {
    if (key == "sunrise" && this.sunrise != null) {
      return DateFormat.jm()
          .format(DateTime.fromMillisecondsSinceEpoch(this.sunrise * 1000));
    }

    if (key == "sunset" && this.sunset != null) {
      return DateFormat.jm()
          .format(DateTime.fromMillisecondsSinceEpoch(this.sunset * 1000));
    }

    if (key == 'updated' && this.updated != null) {
      return DateFormat.jm()
          .format(DateTime.fromMillisecondsSinceEpoch(this.updated * 1000));
    }
    return 'n/a';
  }

  String getTemp(String temp) {
    final String strEnd = ' ${String.fromCharCode($deg)}C';

    if (temp == 'maxTemp' && this.maxTemp != null) {
      return this.maxTemp.toString() + strEnd;
    }

    if (temp == 'temp' && this.temp != null) {
      return this.temp.toString() + strEnd;
    }

    if (temp == 'minTemp' && this.minTemp != null) {
      return this.minTemp.toString() + strEnd;
    }

    return 'n/a';
  }
}
