import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/models/taxi_app.dart';
import '../../data/models/transport.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key, required this.transport});

  final Transport transport;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Driving Side",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              color: Colors.grey
                          )
                      ),

                      Text(
                          transport.drivingSide.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          )
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset("driving-side_${transport.drivingSide.name}.png", width: 55, height: 45)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Taxi apps',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 4,
                    children: transport.taxiApps.map((app) => taxiLabel(app)).toList(),
                  )
                ],
              ),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Metro Systems',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transport.metroSystems.map<Widget>((metro) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: metroBuilder(metro.image, metro.city, '${metro.city} Metro'),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }

  Widget taxiLabel(TaxiApp app) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
          CachedNetworkImage(
            imageUrl: app.imageUrl,
            height: 40,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 2),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Expanded(
            child: Text(
              app.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              overflow:
                  TextOverflow.ellipsis, // optional: handle very long names
            ),
          ),
        ],
      ),
    );
  }

  Widget metroBuilder(String image, String city, String name) {
    return Row(
      spacing: 16,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 2),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          ),
        ),

        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  city,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),

            Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
