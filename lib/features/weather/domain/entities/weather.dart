import 'package:space_scutum_test_task/features/weather/domain/entities/weather_condition.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_main_data.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_wind_data.dart';

/// Entity representing weather data
class Weather {
  /// List of weather conditions(clouds, rain, etc.)
  /// Mostly list of one item
  final List<WeatherCondition> weatherConditions;

  /// Main weather data
  final WeatherMainData mainData;

  /// Wind data
  final WeatherWindData windData;

  /// Constructor for Weather entity
  Weather({
    required this.weatherConditions,
    required this.mainData,
    required this.windData,
  });
}
