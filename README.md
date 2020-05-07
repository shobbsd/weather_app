# Weather App

A Cross Platform Mobile Flutter App that displays the weather for London. The app consists of two sections, at the top is a card which displays the current weather, and below is a list of 3-hourly forecasts. 

## Getting Started

Assumptions:

- The user is in possesion of an open weather api key.

Instructions:

1. Clone down the project.
   - `git clone https://github.com/shobbsd/weather_app.git`
2. cd into the project
   - `cd weather_app` 
3. Create a .env file with your api key
   - `echo API_KEY={YOUR_API_KEY} > .env` 
   - e.g. `echo API_KEY=123 > .env`
4. Download all the required packages
   - `flutter pub get`
5. Run the all tests
   - `flutter test test/`
6. Run the application on a chosen device/emulator
   - `flutter run`



### If Time

- I would have liked to create a theme which was adjuastable depending on the size of the device it was being displayed on.
- I would also add a way to add additional cities. 
- A pull to refresh feature would have been a nice touch.
- And some more time to spend designing and wireframing.
- Widget tests and integration tests would have been a nice addition
