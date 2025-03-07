import 'package:json_annotation/json_annotation.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather_condition.dart';

part 'weather_condition_dto.g.dart';

@JsonSerializable()
class WeatherConditionDTO {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherConditionDTO({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  /// Converts a JSON object to a DTO
  factory WeatherConditionDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionDTOFromJson(json);

  /// Converts a DTO to a JSON object
  Map<String, dynamic> toJson() => _$WeatherConditionDTOToJson(this);

  /// Converts a DTO to a domain entity
  WeatherCondition toDomain() {
    return WeatherCondition(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }

  /// Converts a domain entity to a DTO
  static WeatherConditionDTO fromDomain(WeatherCondition condition) {
    return WeatherConditionDTO(
      id: condition.id,
      main: condition.main,
      description: condition.description,
      icon: condition.icon,
    );
  }
}
