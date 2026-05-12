import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Make sure these paths match your actual folder structure!
import 'bloc/weather_bloc.dart';
import 'screens/weather_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App BLoC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // 1. Wrap your home page in a BlocProvider so the BLoC is available to the UI
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: const WeatherHomePage(),
      ),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller to capture the city name typed by the user
    final TextEditingController cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Checker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 2. Search Field
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: 'Enter City Name (e.g., London, Mumbai)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Search Button
              ElevatedButton(
                onPressed: () {
                  if (cityController.text.isNotEmpty) {
                    // Trigger the Event to fetch weather when the button is pressed
                    context.read<WeatherBloc>().add(
                      WeatherGetEvent(city: cityController.text.trim()),
                    );
                  }
                },
                child: const Text('Check Weather!'),
              ),
              const SizedBox(height: 40),

              // 4. BlocBuilder to rebuild the UI based on the current state
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return const Text('Type a city name and press the button.');
                  }
                  else if (state is WeatherLoadingState) {
                    return const CircularProgressIndicator(); // Show loading spinner
                  }
                  else if (state is WeatherLoadedState) {
                    return WeatherCard(state: state); // Show our custom card
                  }
                  else if (state is WeatherErrorState) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}