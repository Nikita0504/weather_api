import 'dart:convert';

class Weather {
  final double tempC;
  final double tempF;
  final String condition;

  const Weather({
    this.tempC = 0,
    this.tempF = 0,
    this.condition = 'sunny',
  });

  factory Weather.formJson(Map<String, dynamic> json) {
    return Weather(
      tempC: json['current']["temp_c"],
      tempF: json['current']["temp_f"],
      condition: json['current']["condition"]["text"],
    );
  }
}
