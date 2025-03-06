import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather();
}
