import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/get_weather.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      create: (BuildContext context) {
        return WeatherCubit(WeatherServuces());
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
