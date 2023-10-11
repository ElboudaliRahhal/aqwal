import 'package:aqwal/tools/Container_Quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class Personality extends StatefulWidget {
  Personality({super.key,required this.id_personality,});
  final String id_personality;

  @override
  State<Personality> createState() => _PersonalityState();
}

class _PersonalityState extends State<Personality> {
  late BannerAd myBanner;

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    myBanner = BannerAd(size: AdSize.banner,
      adUnitId: 'ca-app-pub-5950908852191001/7278545284',
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

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

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
        title: Text("Quote"),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Books')
                .doc(widget.id_personality)
                .collection('quote')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];

                  return Container_Quote(
                    color: colors[index],
                    name: document['name'],
                    quote: document['quote'],
                    imageUrl: document['imageUrl'],
                  );
                },
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

