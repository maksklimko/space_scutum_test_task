import 'package:space_scutum_test_task/features/weather/domain/entities/weather_condition.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_main_data.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_wind_data.dart';

class Weather {
  final List<WeatherCondition> weatherConditions;
  final WeatherMainData mainData;
  final WeatherWindData windData;

  Weather({
    required this.weatherConditions,
    required this.mainData,
    required this.windData,
  });
}
