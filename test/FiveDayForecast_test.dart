import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/FiveDayForecast.dart';

void main() {
  final String responseStr =
      '{"cod":"200","message":0,"cnt":40,"list":[{"dt":1588777200,"main":{"temp":294.91,"feels_like":293.92,"temp_min":294.66,"temp_max":294.91,"pressure":1017,"sea_level":1017,"grnd_level":1016,"humidity":80,"temp_kf":0.25},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":43},"wind":{"speed":5.5,"deg":133},"rain":{"3h":0.78},"sys":{"pod":"n"},"dt_txt":"2020-05-06 15:00:00"},{"dt":1588788000,"main":{"temp":294.54,"feels_like":294.01,"temp_min":294.37,"temp_max":294.54,"pressure":1015,"sea_level":1015,"grnd_level":1015,"humidity":82,"temp_kf":0.17},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":23},"wind":{"speed":4.87,"deg":130},"rain":{"3h":0.94},"sys":{"pod":"n"},"dt_txt":"2020-05-06 18:00:00"}],"city":{"id":2172797,"name":"Cairns","coord":{"lat":-16.9167,"lon":145.7667},"country":"AU","timezone":36000,"sunrise":1588710638,"sunset":1588751785}}';

  final String hourlyStr =
      '{"dt":1588820400,"main":{"temp":299.84,"feels_like":297.84,"temp_min":299.84,"temp_max":299.84,"pressure":1015,"sea_level":1015,"grnd_level":1014,"humidity":54,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":{"all":0},"wind":{"speed":6.03,"deg":116},"sys":{"pod":"d"},"dt_txt":"2020-05-07 03:00:00"}';

  group("hourlyForecast", () {
    test("hourly forecast can parse from json", () {
      final hourly = HourlyForecast.fromJson(json.decode(hourlyStr));

      final time = DateTime.fromMillisecondsSinceEpoch(1588820400 * 1000);

      expect(hourly.temp, 299.84);
      expect(hourly.description, 'clear sky');
      expect(hourly.icon, "01d");
      expect(hourly.minTemp, 299.84);
      expect(hourly.maxTemp, 299.84);
      expect(hourly.time, time);
    });

    test('getters', () {
      final hourly = HourlyForecast.fromJson(json.decode(hourlyStr));
      final time = DateTime.fromMillisecondsSinceEpoch(1588820400 * 1000);
      const url = "http://openweathermap.org/img/wn/01d@2x.png";

      final formattedDay = DateFormat.EEEE().format(time);
      final formattedTime = DateFormat.Hm().format(time);

      expect(hourly.getDay(), formattedDay);
      expect(hourly.getTime(), formattedTime);
      expect(hourly.getImageUrl(), url);
    });
  });
}
