
import 'package:aqwal/NavBar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String appName = 'Aqwal';
  final String appVersion = '1.0.0';
  final String appDescription = 'the first app that containe all types of quotes';
  final String imagePath = 'assets/icone/logo.png'; // Replace with your logo image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 16.0),
              Text(
                appName,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Version: $appVersion',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                appDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),

      ),
    );
  }
}
