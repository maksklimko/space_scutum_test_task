// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMainDTO _$WeatherMainDTOFromJson(Map<String, dynamic> json) =>
    WeatherMainDTO(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
      seaLevel: (json['sea_level'] as num?)?.toInt(),
      groundLevel: (json['grnd_level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherMainDTOToJson(WeatherMainDTO instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.groundLevel,
    };
