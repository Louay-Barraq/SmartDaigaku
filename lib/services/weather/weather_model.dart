class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String countryCode;
  final int weatherId;

  WeatherModel(
      {required this.cityName,
      required this.temperature,
      required this.mainCondition,
      required this.countryCode,
      required this.weatherId});

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      countryCode: json['sys']['country'],
      weatherId: json['weather'][0]['id'],
    );
  }
}
