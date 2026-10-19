import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:course_11_3/api/weather_api.dart';
import 'package:course_11_3/screens/weather_forecast_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WeatherForecastScreen(locationWeather: weatherInfo);
          },
        ),
      );
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      body: Center(
        child: SpinKitDoubleBounce(color: Color(0xFF0D9488), size: 100.0),
      ),
    );
  }
}
