import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'weather_model.dart';

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather(String cityName, String countryCode) async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?q=$cityName,$countryCode&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<String>> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? cityName = placemarks[0].locality;
    String? countryCode = placemarks[0].isoCountryCode;

    return [cityName ?? "", countryCode ?? ""];
  }
}
