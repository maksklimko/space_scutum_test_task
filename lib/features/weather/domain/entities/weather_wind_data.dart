/// Entity representing wind data
class WeatherWindData {
  /// Speed of the wind
  final double speed;

  /// Direction of the wind
  final int degree;

  /// Gust of the wind
  final double gust;

  /// Constructor for WeatherWindData entity
  WeatherWindData({
    required this.speed,
    required this.degree,
    required this.gust,
  });
}
