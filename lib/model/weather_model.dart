import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String cobdition;
  final double temp;
  final double maxTenp;
  final double minTemp;
  final String date;
  final String icon;
  WeatherModel({
    required this.cobdition,
    required this.date,
    required this.maxTenp,
    required this.minTemp,
    required this.temp,
    required this.icon,
    required this.cityName,
  });
  factory WeatherModel.fromJeson(dynamic data) {
    var jesonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      maxTenp: jesonData['maxtemp_c'],
      minTemp: jesonData['mintemp_c'],
      temp: jesonData['avgtemp_c'],
      icon: data['current']['condition']['icon'],
      cobdition: data['current']['condition']['text'],
      cityName: data['location']['name'],
    );
  }
  @override
  String toString() {
    return 'temp = $temp , date = $date , maxTemp = $maxTenp, condition = $cobdition,';
  }

  MaterialColor getThemeColor() {
    if (cobdition == 'Sunny' || cobdition == 'Clear') {
      return Colors.orange;
    } else if (cobdition == 'Blizzard' ||
        cobdition == 'Patchy snow possible' ||
        cobdition == 'Patchy sleet possible' ||
        cobdition == 'Patchy freezing drizzle possible' ||
        cobdition == 'Blowing snow' ||
        cobdition == 'Light rain' ||
        cobdition == 'Moderate rain') {
      return Colors.blue;
    } else if (cobdition == 'Freezing fog' ||
        cobdition == 'Fog' ||
        cobdition == 'Heavy Cloud' ||
        cobdition == 'Mist' ||
        cobdition == 'Fog' ||
        cobdition == 'Partly cloudy' ||
        cobdition == 'Cloudy') {
      return Colors.blueGrey;
    } else if (cobdition == 'Patchy rain possible' ||
        cobdition == 'Heavy Rain' ||
        cobdition == 'Showers	') {
      return Colors.blue;
    } else if (cobdition == 'Thundery outbreaks possible' ||
        cobdition == 'Moderate or heavy snow with thunder' ||
        cobdition == 'Patchy light snow with thunder' ||
        cobdition == 'Moderate or heavy rain with thunder' ||
        cobdition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
