import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    dynamic weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  data: weatherData,
                )));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitRing(
            color: Colors.white,
          ),
        ));
  }
}




// showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('Allow app to acess your contacts list ?'),
//         content: const Text(
//             'You need to allow contact access in parameters for use your contacts list in the app'),
//         actions: <Widget>[

//           // if user deny again, we do nothing
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Don\'t allow'),
//           ),

//           // if user is agree, you can redirect him to the app parameters :)
//           TextButton(
//             onPressed: () {
//               openAppSettings();
//               Navigator.pop(context);
//             },
//             child: const Text('Allow'),
//           ),

//         ],
//       ),
//     );
//     return;
//   }