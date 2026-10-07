import 'package:course_11_3/api/weather_api.dart';
import 'package:course_11_3/models/weather_forecast_daily.dart';
import 'package:course_11_3/screens/city_screen.dart';
import 'package:course_11_3/widgets/bottom_list_view.dart';
import 'package:course_11_3/widgets/city_view.dart';
import 'package:course_11_3/widgets/detail_view.dart';
import 'package:course_11_3/widgets/temp_view.dart';
import 'package:flutter/material.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;
  const WeatherForecastScreen({super.key, this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String? _cityName;

  @override
  void initState() {
    super.initState();

    forecastObject = widget.locationWeather != null
        ? Future.value(widget.locationWeather)
        : WeatherApi().fetchWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        title: const Text('Weather forecast'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: 50.0),
                    CityView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    TempView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else if (snapshot.hasError) {
                final message = snapshot.error
                    .toString()
                    .replaceFirst('Exception: ', '');
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      message,
                      style: const TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
