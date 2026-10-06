import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:course_11_3/api/weather_api.dart';
import 'package:course_11_3/models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late final Future<WeatherForecast> forecastObject;
  final String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(
      cityName: _cityName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<WeatherForecast>(
        future: forecastObject,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Could not load forecast: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(
                'Forecast for ${snapshot.data?.city?.name ?? _cityName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
          return const Center(
            child: SpinKitDoubleBounce(color: Colors.black87, size: 50),
          );
        },
      ),
    );
  }
}
