import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather.dart';

class ApiService {
  static const String _apiKey = 'a49c8ddfb7b44abba78125951260103';

  static Future<Weather?> getWeather(String city) async {
    // Injecting the requested city and your API key into the URL
    String requestUrl = 'http://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$city&aqi=yes';

    try {
      http.Response response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return Weather.fromJson(decodedData);
      } else {
        print('Error Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('API Error: $e');
      return null;
    }
  }
}