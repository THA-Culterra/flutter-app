import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../Country/domain/entities/CTCardData.dart';
class CTCard extends StatelessWidget {
  const CTCard({
    super.key,
    required this.data,
  });

  final CTCardData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(children: [
            CachedNetworkImage(
              width: 120,
              height: 150,
              imageUrl: data.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),// Adjust opacity if needed
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6), // Dark at bottom
                      Colors.transparent, // Fully transparent at top
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),

        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
              data.name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              )
          ),
        )
      ],
    );
  }
}