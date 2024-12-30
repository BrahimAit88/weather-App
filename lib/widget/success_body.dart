import 'package:flutter/material.dart';

import 'package:weather_app/model/weather_model.dart';

// ignore: must_be_immutable
class SuccessBody extends StatelessWidget {
  SuccessBody({
    required this.weatherData,
    super.key,
  });

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor()[500]!,
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[200]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 170,
          ),
          Text(
            weatherData!.cityName,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(weatherData!.date),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https:${weatherData!.icon}",
                height: 90,
              ),
              Text(
                ' ${weatherData!.temp.toInt()}',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('MaxTemp = ${weatherData!.maxTenp.toInt()}'),
                  Text('minTemp = ${weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            weatherData!.cobdition,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
