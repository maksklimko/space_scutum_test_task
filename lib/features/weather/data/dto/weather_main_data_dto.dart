import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_main_data.dart';

part 'weather_main_data_dto.g.dart';

@JsonSerializable()
class WeatherMainDTO {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? groundLevel;

  WeatherMainDTO({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.groundLevel,
  });

  WeatherMainData toDomain() {
    return WeatherMainData(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
      seaLevel: seaLevel,
      groundLevel: groundLevel,
    );
  }

  factory WeatherMainDTO.fromDomain(WeatherMainData weatherMain) {
    return WeatherMainDTO(
      temp: weatherMain.temp,
      feelsLike: weatherMain.feelsLike,
      tempMin: weatherMain.tempMin,
      tempMax: weatherMain.tempMax,
      pressure: weatherMain.pressure,
      humidity: weatherMain.humidity,
      seaLevel: weatherMain.seaLevel,
      groundLevel: weatherMain.groundLevel,
    );
  }

  factory WeatherMainDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherMainDTOToJson(this);
}
