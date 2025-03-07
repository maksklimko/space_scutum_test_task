import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';

/// Abstract class defining the interface for weather data repository
abstract class WeatherRepository {
  /// Fetches current weather data
  /// Returns a [Weather] entity
  Future<Weather> getWeather();
}
