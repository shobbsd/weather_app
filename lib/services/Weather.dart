import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/CurrentWeather.dart';
import 'package:weather_app/models/FiveDayForecast.dart';

// http://api.openweathermap.org/data/2.5/weather?id=2172797&appid=858f19f326106b5ba3484766f399ef87

class WeatherService {
  final String url = "https://api.openweathermap.org/data/2.5";
  final String api_key;

  WeatherService({@required this.api_key});

  Future<CurrentWeather> fetchCurrentWeather(cityID) async {
    try {
      http.Response res = await http
          .get("$url/weather/?id=$cityID&appid=$api_key&units=metric");

      if (res.statusCode == 200) {
        CurrentWeather weather = CurrentWeather.fromJson(json.decode(res.body));
        return weather;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<FiveDayForecast> fetchFiveDayForecast(cityID) async {
    try {
      http.Response res = await http
          .get("$url/forecast/?appid=$api_key&id=$cityID&units=metric");

      if (res.statusCode == 200) {
        FiveDayForecast forecasts =
            FiveDayForecast.fromJson(json.decode(res.body));

        return forecasts;
      }
    } catch (e) {
      print(e);
    }
  }
}
