import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/CurrentWeatherCard.dart';
import 'package:weather_app/components/ForecastList.dart';
import 'package:weather_app/models/CurrentWeather.dart';
import 'package:weather_app/models/FiveDayForecast.dart';
import 'package:weather_app/services/Weather.dart';

class CityView extends StatefulWidget {
  CityView({Key key, this.cityID}) : super(key: key);

  final String cityID;

  @override
  CityViewState createState() => CityViewState();
}

class CityViewState extends State<CityView> {
  CurrentWeather weatherInfo;
  String day;
  WeatherService weatherService;
  FiveDayForecast fiveDayForecast;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    DateTime timeStamp = DateTime.now();
    day = DateFormat.EEEE().format(timeStamp);

    String api_key = DotEnv().env['API_KEY'];

    weatherService = WeatherService(api_key: api_key);

    updateWeather();
  }

  void updateWeather() {
    final currentWeatherFuture =
        weatherService.fetchCurrentWeather(widget.cityID);

    final fiveDayForecastFuture =
        weatherService.fetchFiveDayForecast(widget.cityID);

    setState(() {
      loading = true;
    });

    Future.wait([currentWeatherFuture, fiveDayForecastFuture])
        .then((responseArr) {
      final CurrentWeather currentForecast = responseArr[0];
      final FiveDayForecast futureForecasts = responseArr[1];

      if (currentForecast == null || futureForecasts == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Issue getting forecast, please try again later"),
        ));
      }

      setState(() {
        if (currentForecast != null) weatherInfo = currentForecast;
        if (futureForecasts != null) fiveDayForecast = futureForecasts;
        loading = false;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    // weather = fetchCurrentWeather();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 5;

    return loading
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            top: true,
            bottom: false,
            right: false,
            left: false,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  Text(
                    "${weatherInfo.cityName}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  CurrentWeatherCard(
                      day: day,
                      width: width,
                      height: height,
                      weatherInfo: weatherInfo),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text("Last update: ${weatherInfo.updated}"),
                  ),
                  Expanded(
                    child: ForecastList(
                      fiveDayForecast: fiveDayForecast,
                      width: width,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
