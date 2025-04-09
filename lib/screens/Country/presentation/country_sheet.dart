import 'package:flutter/material.dart';

import '../domain/categories.dart';
import 'package:flutter_svg/svg.dart';

class CountrySheet extends StatefulWidget {
  const CountrySheet({super.key});

  @override
  _CountrySheetState createState() => _CountrySheetState();
}

class _CountrySheetState extends State<CountrySheet> {
  CountryCategory selectedCategory = CountryCategory.keyInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.45,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    // Horizontal Scrolling Category List
                    SizedBox(
                      height: 68,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children:
                            CountryCategory.values.map((category) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "lib/core/assets/${category.icon}.svg", // Path to your SVG asset
                                        colorFilter: ColorFilter.mode(
                                          selectedCategory == category ? Colors.purple : Colors.grey,
                                          BlendMode.srcIn,
                                        ),
                                        width: 24,
                                        height: 24,
                                      ),
                                      Text(
                                        category.displayName,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          fontWeight:
                                              selectedCategory == category
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                          color:
                                              selectedCategory == category
                                                  ? Colors.purple
                                                  : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                Container(
                  color: Colors.grey[100],
                  child: Flexible(child: selectedCategory.content)
                )],
              ),
          );
        },
      ),
    );
  }
}
