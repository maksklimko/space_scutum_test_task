import 'package:space_scutum_test_task/features/weather/data/sources/weather_remote_data_source.dart';
import 'package:space_scutum_test_task/features/weather/domain/entities/weather.dart';
import 'package:space_scutum_test_task/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Weather> getWeather() async {
    final t = (await remoteDataSource.getWeather()).toDomain();
    return t;
  }
}
