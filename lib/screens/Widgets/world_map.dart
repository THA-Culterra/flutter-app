import 'package:cloud_firestore/cloud_firestore.dart';
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
    return FutureBuilder<List<String>>(
      future: getCountryIDs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading countries'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No countries found'));
        }

        final colorsMap = buildCountryColorMap(snapshot.data!);

        return GradientBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return InteractiveViewer(
                constrained: false,
                boundaryMargin: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 600,
                ),
                minScale: 1.0,
                maxScale: 75,
                child: SizedBox(
                  width: constraints.maxWidth * 0.92,
                  height: constraints.maxHeight,
                  child: SimpleMap(
                    colors: colorsMap,
                    defaultColor: Colors.grey.withOpacity(0.9),
                    fit: BoxFit.fitHeight,
                    countryBorder: CountryBorder(color: Colors.white, width: 2),
                    instructions: SMapWorld.instructions,
                    callback: (id, name, tapDetails) {
                      widget.onCountryTap?.call(id, name);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Map<String, Color> buildCountryColorMap(List<String> countryCodes) {
    final Map<String, Color> colorMap = {};
    for (final code in countryCodes) {
      colorMap[code.toLowerCase()] = Colors.grey.withOpacity(0.4);
    }
    return colorMap;
  }

  Future<List<String>> getCountryIDs() async {
    final snapshot = await FirebaseFirestore.instance.collection('countries').get();
    print(snapshot.docs.map((doc) => doc.id).toList());
    return snapshot.docs.map((doc) => doc.id).toList();
  }
}
