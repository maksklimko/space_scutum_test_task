// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherConditionDTO _$WeatherConditionDTOFromJson(Map<String, dynamic> json) =>
    WeatherConditionDTO(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherConditionDTOToJson(
        WeatherConditionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
