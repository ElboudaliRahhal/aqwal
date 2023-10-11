import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'LoadingScreen.dart';
import 'firebase_options.dart';
import 'Home.dart';



AppOpenAd? appOpenAd;
loadAppOpenAd(){
  AppOpenAd.load(
      adUnitId: 'ca-app-pub-5950908852191001/7387089010',
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
      orientation: AppOpenAd.orientationPortrait);
}







void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();

  loadAppOpenAd();
  runApp(MyApp(),);



}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;



  @override
  void initState() {
    super.initState();
    loadData().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> loadData() async {

    FirebaseMessaging messaging = FirebaseMessaging.instance;




    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      sound: true,
      badge: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {

      String? token = await messaging.getToken();
      await messaging.subscribeToTopic('aqwal');

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, dynamic> data = {
        'token':token,
      };
      firestore.collection("token").doc(token).set(data);
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      // Permission denied
      print('User denied permission');
    } else {
      // Permission not determined
      print('Permission not determined');
    }

    await Future.delayed(Duration(seconds: 2)); // Simulating a 2-second delay

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading ? LoadingScreen() : Home(),
    );
  }
}
