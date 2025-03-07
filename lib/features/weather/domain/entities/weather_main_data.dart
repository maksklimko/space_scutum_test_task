/// Entity representing main weather measurements and conditions
class WeatherMainData {
  /// Current temperature in Fahrenheit
  final double temp;

  /// "Feels like" temperature in Fahrenheityy=
  final double feelsLike;

  /// Minimum temperature in Fahrenheit
  final double tempMin;

  /// Maximum temperature in Fahrenheit
  final double tempMax;

  /// Atmospheric pressure
  final int pressure;

  /// Relative humidity in %
  final int humidity;

  /// Atmospheric pressure at sea level
  final int? seaLevel;

  /// Atmospheric pressure at ground level
  final int? groundLevel;

  WeatherMainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.seaLevel,
    this.groundLevel,
  });
}
