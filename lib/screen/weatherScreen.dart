import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_api/model/weather.dart';
import 'package:weather_api/services/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherServices weatherServices = WeatherServices();
  Weather weather = Weather();
  String country = 'Minsk';
  String currentWeather = '';
  double TempC = 0;
  double TempF = 0;
  @override
  Future<void> getWeather() async {
    weather = await weatherServices.getWeatherData(country);
    setState(() {
      currentWeather = weather.condition;
      TempC = weather.tempC;
      TempF = weather.tempF;
    });

    Future<Weather>? _future;

    void initState() {
      super.initState();

      getWeather();
    }
    /* print(weather.tempC);
    print(weather.tempF);
    print(weather.condition);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<void>(
            future: getWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            //snapshot.data!.Weather.tempC
                            currentWeather,
                            style: const TextStyle(fontSize: 30)),
                        Text('${TempC.toString()} C',
                            style: const TextStyle(fontSize: 30)),
                        Text('${TempF.toString()} F',
                            style: const TextStyle(fontSize: 30)),
                      ],
                    )
                  ],
                ));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            }));
  }
}
