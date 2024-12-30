part of 'weather_cubit.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoedingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

final class WeatherFailureStat extends WeatherState {}
