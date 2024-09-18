import 'package:flutter/material.dart';
import 'package:smart_daigaku/services/weather/weather_model.dart';

class WeatherComponent extends StatelessWidget {
  final WeatherModel? weather;

  const WeatherComponent({required this.weather, Key? key}) : super(key: key);

  String getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return 'assets/images/1.png';
    } else if (code >= 300 && code < 400) {
      return 'assets/images/2.png';
    } else if (code >= 500 && code < 600) {
      return 'assets/images/3.png';
    } else if (code >= 600 && code < 700) {
      return 'assets/images/4.png';
    } else if (code >= 700 && code < 800) {
      return 'assets/images/5.png';
    } else if (code == 800) {
      return 'assets/images/6.png';
    } else if (code > 800 && code <= 804) {
      return 'assets/images/7.png';
    } else {
      return 'assets/images/7.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (weather == null) {
      return Center(
        child: Text(
          'Unable to fetch weather data',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            getWeatherIcon(weather!.weatherId),
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weather?.cityName ?? "City Name",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),
              Text(
                '${weather?.temperature.round()}°C',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ],
      );
    }
  }
}
