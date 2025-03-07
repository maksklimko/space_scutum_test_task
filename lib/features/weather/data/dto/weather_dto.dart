import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_test_task/features/weather/data/dto/weather_condition_dto.dart';
import 'package:space_scutum_test_task/features/weather/data/dto/weather_main_data_dto.dart';
import 'package:space_scutum_test_task/features/weather/data/dto/weather_wind_data_dto.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDTO {
  @JsonKey(name: 'weather')
  final List<WeatherConditionDTO> weatherConditions;

  @JsonKey(name: 'main')
  final WeatherMainDTO mainData;

  @JsonKey(name: 'wind')
  final WeatherWindDTO windData;

  WeatherDTO({
    required this.weatherConditions,
    required this.mainData,
    required this.windData,
  });

  /// Converts the DTO to a domain entity
  Weather toDomain() {
    return Weather(
      weatherConditions: weatherConditions.map((e) => e.toDomain()).toList(),
      mainData: mainData.toDomain(),
      windData: windData.toDomain(),
    );
  }

  /// Converts a domain entity to a DTO
  factory WeatherDTO.fromDomain(Weather weather) {
    return WeatherDTO(
      weatherConditions: weather.weatherConditions
          .map(WeatherConditionDTO.fromDomain)
          .toList(),
      mainData: WeatherMainDTO.fromDomain(weather.mainData),
      windData: WeatherWindDTO.fromDomain(weather.windData),
    );
  }

  /// Converts a JSON object to a DTO
  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);

  /// Converts a DTO to a JSON object
  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}
