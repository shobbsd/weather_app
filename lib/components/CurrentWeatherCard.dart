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
      padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
      child: SizedBox(
          height: height,
          width: width,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
            ),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    TopSection(weatherInfo: weatherInfo, day: day),
                    Spacer(),
                    TopRow(weatherInfo: weatherInfo),
                    MiddleRow(weatherInfo: weatherInfo),
                    BottomRow(weatherInfo: weatherInfo),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class TopSection extends StatelessWidget {
  TopSection({this.weatherInfo, this.day});

  final CurrentWeather weatherInfo;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$day",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(weatherInfo.description,
                style: Theme.of(context).textTheme.headline2)
          ],
        ),
        Spacer(),
        Tab(
          child: Image.network(
            "http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png",
          ),
        ),
        Spacer(),
        TempDisplay(weatherInfo: weatherInfo),
      ],
    );
  }
}

class TempDisplay extends StatelessWidget {
  TempDisplay({this.weatherInfo});

  final CurrentWeather weatherInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("highs: ${weatherInfo.maxTemp} ${String.fromCharCode($deg)}C "),
        Text(
          "${weatherInfo.temp} ${String.fromCharCode($deg)}C ",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text("lows: ${weatherInfo.minTemp} ${String.fromCharCode($deg)}C")
      ],
    );
  }
}

class TopRow extends StatelessWidget {
  TopRow({this.weatherInfo});

  final CurrentWeather weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Sunrise:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "${weatherInfo.sunrise}",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
            child: Text(
              "Sunset:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "${weatherInfo.sunset}",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}

class MiddleRow extends StatelessWidget {
  MiddleRow({this.weatherInfo});

  final CurrentWeather weatherInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Wind:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "${weatherInfo.windSpeed} m/s",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
            child: Text(
              "Humidity:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "${weatherInfo.humidity}%",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  BottomRow({this.weatherInfo});

  final CurrentWeather weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            "Pressure:",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Expanded(
          child: Text(
            "${weatherInfo.pressure} hPa",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Expanded(
          child: Text(
            "Visibility:",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Expanded(
          child: Text(
            "${weatherInfo.visibility} km",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        )
      ],
    );
  }
}
