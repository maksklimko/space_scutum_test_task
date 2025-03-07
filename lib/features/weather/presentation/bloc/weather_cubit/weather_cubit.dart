import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';
import 'package:space_scutum_test_task/features/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

/// Cubit for managing weather data state
class WeatherCubit extends Cubit<WeatherState> {
  /// Constructor for WeatherCubit
  WeatherCubit(this._getWeatherUseCase) : super(WeatherInitial());

  final GetWeatherUseCase _getWeatherUseCase;

  /// Fetches weather data from the use case
  Future getWeatherData() async {
    final weather = await _getWeatherUseCase.call();
    emit(WeatherLoaded(weather: weather));
  }
}
