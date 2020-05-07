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
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Text(
                    forecast.getTime(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Tab(child: Image.network(forecast.getImageUrl()))
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    forecast.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          forecast.minTemp.toString(),
                          style:
                              TextStyle(color: Colors.red[700], fontSize: 11),
                        ),
                        Text(
                          " ${forecast.temp} ${String.fromCharCode($deg)}C ",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(forecast.maxTemp.toString(),
                            style: TextStyle(
                                color: Colors.blue[700], fontSize: 11))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
