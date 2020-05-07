import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/CurrentWeather.dart';
import 'package:weather_app/models/FiveDayForecast.dart';

class WeatherService {
  final String url = "https://api.openweathermap.org/data/2.5";
  final String apiKey;

  WeatherService({@required this.apiKey});

  Future<CurrentWeather> fetchCurrentWeather(cityID) async {
    try {
      http.Response res =
          await http.get("$url/weather/?id=$cityID&appid=$apiKey&units=metric");

      if (res.statusCode == 200) {
        CurrentWeather weather = CurrentWeather.fromJson(json.decode(res.body));
        return weather;
      }

      return null;
    } on SocketException {} catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<FiveDayForecast> fetchFiveDayForecast(cityID) async {
    try {
      http.Response res = await http
          .get("$url/forecast/?appid=$apiKey&id=$cityID&units=metric");

      if (res.statusCode == 200) {
        FiveDayForecast forecasts =
            FiveDayForecast.fromJson(json.decode(res.body));

        return forecasts;
      }

      return null;
    } on SocketException {} catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
