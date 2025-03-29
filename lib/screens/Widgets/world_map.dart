
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomWorldMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom World Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(0, 0), // Starting point in the center of the world map
          zoom: 2.0, // World zoom level (you can adjust this as needed)
        ),
        layers: [
          // Background layer with OpenStreetMap or custom tiles
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // OpenStreetMap
            subdomains: ['a', 'b', 'c'],
          ),
          // Custom markers (Add your own markers for places on the map)
          MarkerLayerOptions(
            markers: [
              Marker(
                point: LatLng(51.5074, -0.1278), // Example: London
                builder: (context) => Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30.0,
                ),
              ),
              Marker(
                point: LatLng(40.7128, -74.0060), // Example: New York
                builder: (context) => Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
            ],
          ),
          // Custom countries/borders layer (optional: you can use GeoJSON for borders)
          // You can use ShapeFile or GeoJSON data for borders if needed
        ],
      ),
    );
  }
}