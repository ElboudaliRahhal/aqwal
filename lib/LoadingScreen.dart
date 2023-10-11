import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/icone/logo.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20,),
            CircularProgressIndicator(),
          ],
        ), // or any loading indicator widget
      ),
    );
  }
}
