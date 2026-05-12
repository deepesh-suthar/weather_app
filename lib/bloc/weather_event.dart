part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherInitialEvent extends WeatherEvent {}

class WeatherGetEvent extends WeatherEvent {
  final String city;
  WeatherGetEvent({required this.city});
}