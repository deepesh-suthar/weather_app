part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  final String message;
  WeatherErrorState({required this.message});
}