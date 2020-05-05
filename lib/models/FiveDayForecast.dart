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
  final int time;
  final double temp;
  final String description;
  final String icon;

  HourlyForecast({this.description, this.icon, this.temp, this.time});

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
        time: json['dt'],
        temp: json['main']['temp'],
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon']);
  }
}
