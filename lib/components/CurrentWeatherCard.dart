import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/CurrentWeather.dart';

class CurrentWeatherCard extends StatelessWidget {
  CurrentWeatherCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.weatherInfo,
      @required this.day})
      : super(key: key);

  double height;
  double width;
  CurrentWeather weatherInfo;
  String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SizedBox(
          height: height,
          width: width,
          child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$day"),
                    Tab(
                      icon: Image.network(
                          "http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png"),
                    ),
                    Spacer(),
                    Text("${weatherInfo.temp} ${String.fromCharCode($deg)}C "),
                    Text("${weatherInfo.minTemp} ${String.fromCharCode($deg)}C")
                  ],
                ),
                Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Sunrise ${weatherInfo.sunrise}"),
                      Text("Sunset ${weatherInfo.sunset}"),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Wind ${weatherInfo.windSpeed} m/s"),
                    Text("Humidity ${weatherInfo.humidity}%"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Pressure ${weatherInfo.pressure} hPa"),
                    Text("Visibility ${weatherInfo.visibility} km")
                  ],
                )
              ],
            ),
          )),
    );
  }
}
