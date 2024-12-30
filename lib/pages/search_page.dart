import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
  });

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Search Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Center(
          child: TextField(
            onChanged: (data) {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeatherServes(cityName: cityName!);
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeatherServes(cityName: cityName!);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: const Text('Search'),
              hintText: 'Enter City Name',
              suffixIcon: IconButton(
                onPressed: () async {
                  if (cityName != null) {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeatherServes(cityName: cityName!);

                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
