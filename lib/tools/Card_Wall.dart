import 'package:flutter/material.dart';

class Card_Wall extends StatelessWidget {
  const Card_Wall({super.key,required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children: [
            Expanded(
              child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                    ),
                  ),
            ),
          ],
        ),

    );
  }
}
