import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';
import 'package:space_scutum_test_task/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Weather> call() async {
    return repository.getWeather();
  }
}
