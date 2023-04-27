//import 'dart:ffi';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/model/weather.dart';

class WeatherServices {
  Future<Weather> getWeatherData(String place) async {
    //e661a30bcaa5438dba495231232304
    try {
      final queryParameters = {
        'key': "e661a30bcaa5438dba495231232304",
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.formJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not  get  weather");
      }
    } catch (e) {
      rethrow;
    }
  }
}
