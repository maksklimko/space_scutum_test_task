import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';
import 'package:space_scutum_test_task/features/weather/domain/repositories/weather_repository.dart';

/// Usecase responsible for fetching weather data from repository
class GetWeatherUseCase {
  final WeatherRepository repository;

  /// Creates a new instance with the given weather repository
  GetWeatherUseCase(this.repository);

  /// Fetches current weather data
  /// Returns a [Weather] entity
  Future<Weather> call() async {
    return repository.getWeather();
  }
}
