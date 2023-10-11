import 'dart:io';

import 'package:aqwal/tools/Character_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Quote.dart';


class Character extends StatefulWidget {
  const Character({super.key, required this.id, required this.page});
  final String id;
  final String page;

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  late BannerAd myBanner;

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    myBanner = BannerAd(size: AdSize.banner,
      adUnitId: 'ca-app-pub-5950908852191001/7470116978',
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
      appBar: AppBar(
        title: Text('Character'),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(widget.page)
                .doc(widget.id)
                .collection('char')
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
                                  builder: (context) => Quote(id_anime: widget.id,
                                    id_character: document.id,
                                    page: widget.page,
                                  )
                              )
                          );
                        }
                        ,
                        child: Character_card(
                          title: document['name'],
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
