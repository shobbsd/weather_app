class CurrentWeather {
  final Map<String, dynamic> coord;
  final List<dynamic> weather;
  final String base;
  final Map<String, dynamic> main;
  final int visibility;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> clouds;
  final int dt;
  final Map<String, dynamic> sys;
  final int id;
  final String name;
  final int cod;

  CurrentWeather(
      {this.base,
      this.clouds,
      this.cod,
      this.coord,
      this.dt,
      this.id,
      this.main,
      this.name,
      this.sys,
      this.visibility,
      this.weather,
      this.wind});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
        base: json['base'],
        clouds: json['clouds'],
        cod: json['cod'],
        coord: json['coord'],
        dt: json['dt'],
        id: json['id'],
        main: json['main'],
        name: json['name'],
        sys: json['sys'],
        visibility: json['visibility'],
        weather: json['weather'],
        wind: json['wind']);
  }
}
