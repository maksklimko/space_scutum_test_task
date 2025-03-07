part of 'weather_cubit.dart';

/// Sealed class representing the state of the weather cubit
/// Extends Equatable to support value equality comparisons
sealed class WeatherState extends Equatable {
  const WeatherState({this.isLoading = false});

  /// Whether the weather data is currently being loaded
  final bool isLoading;

  /// Creates a new instance of WeatherState with optional loading state
  WeatherState copyWith({bool? isLoading});

  @override
  List<Object> get props => [isLoading];
}

/// Initial state of the weather cubit
final class WeatherInitial extends WeatherState {
  const WeatherInitial({
    super.isLoading,
  });

  @override
  WeatherInitial copyWith({
    bool? isLoading,
  }) {
    return WeatherInitial(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}

/// State representing the weather data being loaded
final class WeatherLoaded extends WeatherState {
  const WeatherLoaded({
    super.isLoading,
    required this.weather,
  });

  final Weather weather;

  @override
  WeatherLoaded copyWith({
    bool? isLoading,
    Weather? weather,
  }) {
    return WeatherLoaded(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object> get props => [isLoading, weather];
}
