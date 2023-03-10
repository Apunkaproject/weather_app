class Weather {
  final String cityName;
  final double temperature;
  final double windSpeed;
  final String description;
  final int pressure;
  final int humidity;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });
}
