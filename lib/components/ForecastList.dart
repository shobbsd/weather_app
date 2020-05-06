import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/WeatherTile.dart';
import 'package:weather_app/models/FiveDayForecast.dart';

class ForecastList extends StatefulWidget {
  final FiveDayForecast fiveDayForecast;
  final double width;

  ForecastList({this.fiveDayForecast, this.width});

  @override
  _ForecastListState createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  List cardTiles;

  @override
  void initState() {
    super.initState();
    cardTiles = widget.fiveDayForecast.forecasts.fold([], (prev, element) {
      if (prev.length == 0) {
        prev.add(element.getDay());
      }
      if (element.getTime() == "01:00") {
        prev.add(element.getDay());
      }
      prev.add(element);
      return prev;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ListView.builder(
          itemCount: cardTiles == null ? 0 : cardTiles.length,
          itemBuilder: (BuildContext context, int index) {
            final forecast = cardTiles[index];
            if (forecast is String) {
              return ListTile(
                title: Text(
                  forecast,
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            }
            if (forecast is HourlyForecast) {
              return WeatherTile(
                forecast: forecast,
              );
            }
          },
        ),
      ),
    );
  }
}
