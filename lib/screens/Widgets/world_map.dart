import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:culterra/screens/Widgets/gradient_background.dart';
import 'package:flutter/material.dart';

class WorldMap extends StatefulWidget {
  const WorldMap({super.key, this.onCountryTap});

  final void Function(String id, String name)? onCountryTap;

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            constrained: false,
            boundaryMargin: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 600,
            ),
            minScale: 1.0,
            maxScale: 75,
            child: SizedBox(
              width:
                  constraints.maxWidth * 0.92, // Adjusts map width to 92% of available width
              height: constraints.maxHeight,
              child: SimpleMap(
                defaultColor: Color(0xFFD6D6D6).withOpacity(0.6),
                fit: BoxFit.fitHeight,
                countryBorder: CountryBorder(color: Colors.white, width: 2),
                instructions: SMapWorld.instructions,
                callback: (id, name, tapDetails) {
                  if (widget.onCountryTap != null) {
                    widget.onCountryTap!(id, name); // Call the callback
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
