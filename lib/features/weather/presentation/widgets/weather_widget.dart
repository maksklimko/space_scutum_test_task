import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/weather/presentation/bloc/weather_cubit/weather_cubit.dart';
import 'package:space_scutum_test_task/shared/resources/app_colors.dart';
import 'package:space_scutum_test_task/shared/resources/app_constants.dart';
import 'package:space_scutum_test_task/shared/resources/app_paddings.dart';
import 'package:space_scutum_test_task/shared/resources/app_strings.dart';

/// Widget that displays weather information
class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          final condition = state.weather.weatherConditions.first;
          return Container(
            padding: AppPaddings.p20,
            width: double.infinity,
            color: Theme.of(context).primaryColor.withAlpha(50),
            child: SafeArea(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        condition.main,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        condition.description,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.black54,
                                ),
                      ),
                      Spacer(),
                      Text(
                        "${AppStrings.temperature}: ${state.weather.mainData.temp.round().toString()} °F",
                      ),
                      Text(
                        "${AppStrings.windSpeed}: ${state.weather.windData.speed.toString()} m/s",
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  if (state.weather.weatherConditions.isNotEmpty)
                    Image.network(
                      "${AppConstants.weatherIconsUrl}${state.weather.weatherConditions.first.icon}@2x.png",
                    ),
                  Spacer(),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
