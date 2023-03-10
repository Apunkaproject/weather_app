import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

// import 'weather.dart';

class WeatherController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWeather("indor");
  }

  var weather = Weather(
          cityName: '',
          temperature: 0.0,
          description: '',
          humidity: 0,
          pressure: 0,
          windSpeed: 0.0)
      .obs;

  Future<void> getWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=d25a5a0869dde7c75ff6d48ae6007f56');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final cityName = jsonData['name'];
      final temperature = jsonData['main']['temp'];
      final humidity = jsonData['main']['humidity'];
      final pressure = jsonData['main']['pressure'];
      final description = jsonData['weather'][0]['description'];
      final windSpeed = jsonData['wind']['speed'];
      try {
        weather.value = Weather(
          cityName: cityName,
          temperature: temperature,
          description: description,
          humidity: humidity,
          pressure: pressure,
          windSpeed: windSpeed,
        );
      } catch (ex) {
        print("Someting wrong");
      }
      print("City Name ❤️ " + weather.value.cityName);
      print("Tempreture ❤️ " + weather.value.temperature.toString());
      print("humidity ❤️ " + weather.value.humidity.toString());
      print("pressure ❤️ " + weather.value.pressure.toString());
      print("windspeed ❤️ " + weather.value.windSpeed.toString());
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
