import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/weather.dart';
import '../services/api_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {

    // Modern syntax replacing the older mapEventToState
    on<WeatherGetEvent>((event, emit) async {
      emit(WeatherLoadingState()); // Show CircularProgressIndicator

      Weather? weather = await ApiService.getWeather(event.city);

      if (weather != null) {
        emit(WeatherLoadedState(weather: weather)); // Data successfully fetched
      } else {
        emit(WeatherErrorState(message: "Failed to fetch weather for ${event.city}"));
      }
    });

  }
}