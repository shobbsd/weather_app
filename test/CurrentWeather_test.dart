import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/CurrentWeather.dart';

void main() {
  const responseStr =
      '{"coord":{"lon":145.77,"lat":-16.92},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"base":"stations","main":{"temp":21.19,"feels_like":19.33,"temp_min":19.44,"temp_max":23,"pressure":1015,"humidity":69},"visibility":10000,"wind":{"speed":5.1,"deg":180},"rain":{"1h":0.39},"clouds":{"all":7},"dt":1588780527,"sys":{"type":1,"id":9490,"country":"AU","sunrise":1588797056,"sunset":1588838159},"timezone":36000,"id":2172797,"name":"Cairns","cod":200}';

  test('parses from json', () {
    final currWeather = CurrentWeather.fromJson(json.decode(responseStr));

    expect(currWeather.cityName, "Cairns");
    expect(currWeather.icon, "10n");
    expect(currWeather.temp, 21);
    expect(currWeather.maxTemp, 23);
    expect(currWeather.minTemp, 19);
    expect(currWeather.windSpeed, 5);
    expect(currWeather.pressure, 1015);
    expect(currWeather.humidity, 69);
    expect(currWeather.visibility, 10);
    expect(currWeather.sunrise, 1588797056);
    expect(currWeather.sunset, 1588838159);
    expect(currWeather.updated, 1588780527);
  });

  test('getTime', () {
    final currWeather = CurrentWeather.fromJson(json.decode(responseStr));

    expect(currWeather.getTemp('maxTemp'), "23 °C");
    expect(currWeather.getTemp('temp'), "21 °C");
    expect(currWeather.getTemp('minTemp'), "19 °C");
    expect(currWeather.getTemp('WRONG-VAL'), "n/a");
  });

  test('getTemp', () {
    final currWeather = CurrentWeather.fromJson(json.decode(responseStr));

    expect(currWeather.getTime('sunrise'), "9:30 PM");
    expect(currWeather.getTime('sunset'), "8:55 AM");
    expect(currWeather.getTime('updated'), "4:55 PM");
    expect(currWeather.getTime('WRONG-VAL'), "n/a");
  });
}
