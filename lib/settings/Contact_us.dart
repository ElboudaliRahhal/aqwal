import 'package:aqwal/NavBar.dart';
import 'package:flutter/material.dart';

class Contact_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contact information.
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('aqwalsuport0@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+212653393453'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('Fez city Morocco'),
            ),

          ],
        ),
      ),
    );
  }
}