import 'package:dio/dio.dart';
import 'package:space_scutum_test_task/features/weather/data/dto/weather_dto.dart';
import 'package:space_scutum_test_task/shared/resources/app_constants.dart';
import 'package:space_scutum_test_task/shared/utils/api_keys.dart';

class WeatherRemoteDataSource {
  final Dio client;

  WeatherRemoteDataSource(this.client);

  Future<WeatherDTO> getWeather() async {
    final response = await client
        .get("${AppConstants.weatherApiBaseUrl}weather", queryParameters: {
      'lat': AppConstants.demoLatitude,
      'lon': AppConstants.demoLongitude,
      'appid': ApiKeys.weatherApiKey,
    });

    return WeatherDTO.fromJson(response.data);
  }
}
