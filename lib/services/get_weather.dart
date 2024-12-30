import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServuces {
  String basUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '8e387700032a4d63a95115211241112';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
        '$basUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJeson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
