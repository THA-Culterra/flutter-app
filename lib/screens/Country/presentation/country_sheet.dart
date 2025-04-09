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
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Algeria",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Sticky category row
              SliverPersistentHeader(
                pinned: true, // Makes it stick to the top
                floating: false,
                delegate: CategoryHeaderDelegate(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
              ),

              // Scrolling content
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.grey[100],
                    child: selectedCategory.content,
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final CountryCategory selectedCategory;
  final Function(CountryCategory) onCategorySelected;

  CategoryHeaderDelegate({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  double get minExtent => 68; // Minimum height when scrolled to the top
  @override
  double get maxExtent => 68; // Fixed height

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double radius = shrinkOffset > 0 ? 0 : 16;

    return Material(
      // Wrap with Material to ensure decoration applies correctly
      elevation: shrinkOffset > 0 ? 4 : 0, // Optional shadow for smooth effect
      color: Colors.white, // Ensure background color applies correctly
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children:
              CountryCategory.values.map((category) {
                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "lib/core/assets/${category.icon}.svg",
                          colorFilter: ColorFilter.mode(
                            selectedCategory == category
                                ? Colors.purple
                                : Colors.grey,
                            BlendMode.srcIn,
                          ),
                          width: 24,
                          height: 24,
                        ),
                        Text(
                          category.displayName,
                          style: TextStyle(
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
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
