import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_wind_data.dart';

part 'weather_wind_data_dto.g.dart';

@JsonSerializable()
class WeatherWindDTO {
  final double speed;
  @JsonKey(name: 'deg')
  final int degree;
  final double gust;

  WeatherWindDTO({
    required this.speed,
    required this.degree,
    required this.gust,
  });

  WeatherWindData toDomain() {
    return WeatherWindData(
      speed: speed,
      degree: degree,
      gust: gust,
    );
  }

  factory WeatherWindDTO.fromDomain(WeatherWindData weatherWind) {
    return WeatherWindDTO(
      speed: weatherWind.speed,
      degree: weatherWind.degree,
      gust: weatherWind.gust,
    );
  }

  factory WeatherWindDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherWindDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherWindDTOToJson(this);
}
