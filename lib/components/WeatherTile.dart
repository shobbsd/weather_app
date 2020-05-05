import 'package:charcode/charcode.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/FiveDayForecast.dart';

class WeatherTile extends StatelessWidget {
  final HourlyForecast forecast;

  WeatherTile({this.forecast});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  forecast.getTime(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Tab(child: Image.network(forecast.getImageUrl()))
              ],
            ),
            Spacer(),
            Column(
              children: <Widget>[
                Text(
                  forecast.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "${forecast.temp} ${String.fromCharCode($deg)}C ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
