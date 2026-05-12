import 'package:flutter/material.dart';
import '../bloc/weather_bloc.dart';

class WeatherCard extends StatelessWidget {
  final WeatherLoadedState state;

  const WeatherCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 3.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white70,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('City: ${state.weather.city}, ${state.weather.country} 🏡', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10.0),
            Text('Condition: ${state.weather.condition}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10.0),
            Text('Temperature: ${state.weather.tempC} °C', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10.0),
            Text('Humidity: ${state.weather.humidity}%', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10.0),
            Text('Wind: ${state.weather.windKph} km/h', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}