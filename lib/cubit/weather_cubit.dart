import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/get_weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServuces) : super(WeatherInitial());
  WeatherServuces weatherServuces;

  String? cityName;

  void getWeatherServes({required String cityName}) async {
    emit(WeatherLoedingState());
    try {
      WeatherModel? weatherModel =
          await weatherServuces.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } catch (e) {
      print(e);
      emit(WeatherFailureStat());
    }
  }
}
