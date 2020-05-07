import 'package:intl/intl.dart';

class FiveDayForecast {
  final String cityName;
  final int count;
  final List<HourlyForecast> forecasts;
  final int sunrise;
  final int sunset;

  FiveDayForecast(
      {this.cityName, this.count, this.forecasts, this.sunrise, this.sunset});

  factory FiveDayForecast.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;

    List<HourlyForecast> forecasts =
        list.map((forecast) => HourlyForecast.fromJson(forecast)).toList();

    return FiveDayForecast(
        cityName: json['city']['name'],
        count: json['cnt'],
        forecasts: forecasts,
        sunrise: json['city']['sunrise'],
        sunset: json['city']['sunset']);
  }
}

class HourlyForecast {
  final DateTime time;
  final double temp;
  final String description;
  final String icon;
  final double minTemp;
  final double maxTemp;

  HourlyForecast(
      {this.minTemp,
      this.maxTemp,
      this.description,
      this.icon,
      this.temp,
      this.time});

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);

    dynamic temp = json['main']['temp'];
    if (temp != null) temp = temp.toDouble();

    dynamic minTemp = json['main']['temp_min'];
    if (minTemp != null) minTemp = minTemp.toDouble();

    dynamic maxTemp = json['main']['temp_max'];
    if (maxTemp != null) maxTemp = maxTemp.toDouble();

    return HourlyForecast(
        time: time,
        temp: temp,
        description: json['weather'][0]['description'],
        minTemp: minTemp,
        maxTemp: maxTemp,
        icon: json['weather'][0]['icon']);
  }

  String getDay() {
    return DateFormat.EEEE().format(time);
  }

  String getTime() {
    return DateFormat.Hm().format(time);
  }

  String getImageUrl() {
    return "http://openweathermap.org/img/wn/$icon@2x.png";
  }
}
