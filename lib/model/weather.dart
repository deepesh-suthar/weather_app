class Weather {
  final String city;
  final String? country;
  final double tempC;
  final String condition;
  final int humidity;
  final String windKph;
  bool? isCelsius = true;


  Weather({
    required this.city,
    this.country,
    required this.tempC,
    required this.condition,
    required this.humidity,
    required this.windKph,
    this.isCelsius
  });

  // Factory constructor to parse the JSON from WeatherAPI
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      humidity: json['current']['humidity'],
      windKph: json['current']['wind_kph'],
    );
  }
}