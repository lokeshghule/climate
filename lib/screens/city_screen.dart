import 'package:climate/utilties/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? typedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Text('Search Cities'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextField(
              decoration: kInputTextFieldDecoration,
              onChanged: (val) {
                typedName = val;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, typedName);
            },
            child: Text('Get Weather'),
          ),
        ],
      ),
    );
  }
}
