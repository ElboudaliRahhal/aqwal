import 'package:aqwal/NavBar.dart';
import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Share'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // A text field to enter the text to share.
              Text('click on the button to copie the app link'),
              ElevatedButton(
                onPressed: () {
                  // Get the app link.
                  String appLink = '';
                  SnackBar snackBar = SnackBar(
                    content: Text('App link copied to clipboard'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('Copy app link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}