import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widget/initial_body.dart';
import 'package:weather_app/widget/success_body.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: weatherModel == null
                  ? Colors.blueAccent
                  : weatherModel!.getThemeColor(),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext buildContext) {
                          return SearchPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
              title: const Text(
                'Weather App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            body: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoedingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherSuccessState) {
                  weatherModel = state.weatherModel;
                  return SuccessBody(
                    weatherData: state.weatherModel,
                  );
                } else if (state is WeatherFailureStat) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Somthing went wrong',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            'please try again',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const InitialBody();
                }
              },
            ));
      },
    );
  }
}
