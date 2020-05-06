import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/CityView.dart';

var theme = ThemeData(
    primaryColor: Colors.lightBlue[50],
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 60.0 * 0.8, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 30.0 * 0.8, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 20.0 * 0.8),
      headline4: TextStyle(fontSize: 30.0 * 0.8),
      subtitle1: TextStyle(fontSize: 15.0 * 0.8, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontSize: 15.0 * 0.8),
      bodyText1: TextStyle(fontSize: 20 * 0.8),
    )
    // : TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
    );

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<CityViewState> _cityViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              _cityViewKey.currentState.updateWeather();
            },
          ),
          backgroundColor: Colors.lightBlue[50],
          body: CityView(cityID: "2643743", key: _cityViewKey)),
    );
  }
}
