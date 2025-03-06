part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState({this.isLoading = false});

  final bool isLoading;

  WeatherState copyWith({bool? isLoading});

  @override
  List<Object> get props => [isLoading];
}

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
