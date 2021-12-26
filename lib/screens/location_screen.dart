import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final data;
  LocationScreen({this.data});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temp;
  int? condition;
  String? city;
  String? message;
  String? icon;
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        condition = 0;
        city = '';
        message = 'Error fetching location';
        icon = ":(";
      } else {
        double t = weatherData['main']['temp'];
        temp = t.toInt();
        condition = weatherData['weather'][0]['id'];
        city = weatherData['name'];
        message = '${weather.getMessage(temp!)} in $city';
        icon = weather.getWeatherIcon(condition!);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    temp.toString() + '°',
                    style: TextStyle(
                      fontSize: 82,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    icon!,
                    style: TextStyle(fontSize: 82),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 60),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Sunny_Day.jpg'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
