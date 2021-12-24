import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';

import '../services/location.dart';

const apiKey = 'd0481bdcc3c0e8f35179b7d4942e4c06';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${latitude!.round()}&lon=${longitude!.round()}&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LocationScreen()));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text("button"),
        onPressed: () {},
      ),
    ));
  }
}
