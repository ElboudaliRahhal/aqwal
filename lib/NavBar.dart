import 'package:aqwal/shows/Anime.dart';
import 'package:aqwal/settings/Contact_us.dart';
import 'package:aqwal/Home.dart';
import 'package:aqwal/settings/Privacy.dart';
import 'package:aqwal/shows/Wall.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'settings/About.dart';
import 'shows/Books.dart';
import 'shows/Series.dart';
import 'settings/Share.dart';

class NavBar extends StatefulWidget {
   NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int maxFailedLoadAttempts = 3;

  InterstitialAd? _interstitialAd;

  int _numInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-5950908852191001/8110025624',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           Container(
             child: Image.asset('assets/aqwal.png'),
           ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/home.png'),
              ),
              title: Text('Home'),
              onTap: () {
                _showInterstitialAd();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(), // Navigate to the details screen
                  ),
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/ninja.png'),
              ),
              title: Text('Anime'),
              onTap: () {
                _showInterstitialAd();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Anime(), // Navigate to the details screen
                  ),
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/viking-ship.png'),
              ),
              title: Text('Series'),
              onTap: () {
                _showInterstitialAd();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Series())
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/famous.png'),
              ),
              title: Text('Famous'),
              onTap: () {
                _showInterstitialAd();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Books())
                );
              },
            ),

            ListTile(
              leading: Image(
                image: AssetImage('assets/wall.png'),
              ),
              title: Text('Murals'),
              onTap: () {
                _showInterstitialAd();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Wall())
                );
              },
            ),
            Divider(thickness: 1.5,),
            ListTile(
              leading: Image(
                image: AssetImage('assets/privacy.png'),
              ),
              title: Text('privacy policy'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Privacy())
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/contact_us.png'),
              ),
              title: Text('contact us'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Contact_us())
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/share.png'),
              ),
              title: Text('share'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Share())
                );
              },
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/about.png'),
              ),
              title: Text('About the App'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => About())
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
