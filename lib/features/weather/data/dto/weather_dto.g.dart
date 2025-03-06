// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) => WeatherDTO(
      weatherConditions: (json['weather'] as List<dynamic>)
          .map((e) => WeatherConditionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainData: WeatherMainDTO.fromJson(json['main'] as Map<String, dynamic>),
      windData: WeatherWindDTO.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDTOToJson(WeatherDTO instance) =>
    <String, dynamic>{
      'weather': instance.weatherConditions,
      'main': instance.mainData,
      'wind': instance.windData,
    };
