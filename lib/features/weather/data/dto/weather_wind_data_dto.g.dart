// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_wind_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherWindDTO _$WeatherWindDTOFromJson(Map<String, dynamic> json) =>
    WeatherWindDTO(
      speed: (json['speed'] as num).toDouble(),
      degree: (json['deg'] as num).toInt(),
      gust: (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherWindDTOToJson(WeatherWindDTO instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degree,
      'gust': instance.gust,
    };
