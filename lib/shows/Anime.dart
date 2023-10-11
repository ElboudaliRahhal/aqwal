import 'dart:io';

import 'package:aqwal/display/Character.dart';
import 'package:aqwal/tools/CustomCard.dart';
import 'package:aqwal/NavBar.dart';
import 'package:aqwal/display/Quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';









class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {

  final String page = 'Anime';

  late BannerAd myBanner;
  bool _isLoaded = false;


  @override
  void initState() {
    super.initState();

    myBanner = BannerAd(size: AdSize.banner,
      adUnitId: 'ca-app-pub-5950908852191001/6759670537',
      request: AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }


  @override
  Widget build(BuildContext context) {

    final AdWidget adWidget = AdWidget(ad: myBanner);

    final Container adContainer = Container(
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );



    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Anime'),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(page)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount:  snapshot.data!.docs.length, //posts.length,
                      itemBuilder: (context, index) {
                   DocumentSnapshot document = snapshot.data!.docs[index];

                  return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Character(id: document.id,page: page,))
                    );
              }
              ,
              child: CustomCard(
              title: document['title'],
              subtitle: document['subtitle'],
              imageUrl: document['imageUrl'],
              )
              );
              },
              ),
              );
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: adContainer),
        ],
      ),
    );
  }
}



