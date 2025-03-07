class WeatherCondition {
  /// Weather condition ID
  final int id;

  /// Main weather condition(clouds, rain, etc.)
  final String main;

  /// Description of the weather condition
  final String description;

  /// Icon name of the weather condition
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}
