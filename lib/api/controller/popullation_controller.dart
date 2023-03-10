import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PoppulationController extends GetxController {
  Future<void> getPoppulation(String city) async {
    final response = await http.get(
      Uri.parse(
          'https://countries-cities.p.rapidapi.com/location/$city/5128580'),
      headers: {
        'X-RapidAPI-Key': '7b76b45420msh631f27d49acaf8bp1eb0c3jsnea66b19011f5',
        'X-RapidAPI-Host': 'countries-cities.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
