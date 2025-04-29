import 'package:flutter/material.dart';

import '../domain/entities/categories.dart';
import 'package:flutter_svg/svg.dart';

import '../data/models/country.dart';

class CountrySheet extends StatefulWidget {
  const CountrySheet({super.key, required this.country});

  final Country country;

  @override
  _CountrySheetState createState() => _CountrySheetState();
}

class _CountrySheetState extends State<CountrySheet> {
  CountryCategory selectedCategory = CountryCategory.keyInfo;

  double _opacity = 1.0;
  double _currentSize = 0.6;
  bool _showAppBar = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              setState(() {
                _currentSize = notification.extent; // Gets the current size (0.5 to 1)
                double fadeStart = 0.75; // Start fading at 75% of max expansion
                double fadeEnd = 0.9; // Fully faded at 90% of max expansion
                _showAppBar = _currentSize == 1;

                if (_currentSize <= fadeStart) {
                  _opacity = 1.0; // Fully visible before 75%
                } else {
                  _opacity = (1 -
                          ((_currentSize - fadeStart) / (fadeEnd - fadeStart)))
                      .clamp(0.0, 1.0);
                }
              });
              return true;
            },

            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  expandedHeight: 0, // No expanded height, it's dynamic
                  backgroundColor: _showAppBar ? Color(0xFF0E288F) : Colors.transparent,
                  elevation: _showAppBar ? 4 : 0,
                  title: AnimatedOpacity(
                    duration: Duration(milliseconds: 1000), // Duration for fade effect
                    opacity: _showAppBar ? 1.0 : 0.0, // Fade in/out depending on _showAppBar
                    child: _showAppBar
                        ? Text(
                      widget.country.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : Container(), // Empty container when not showing
                  ),
                ),

                SliverToBoxAdapter(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: _opacity > 0 ? 80 : 0, // Smooth transition
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _opacity,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.country.name,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    showAppBar: _showAppBar
                  ),
                ),

                // Scrolling content
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      color: Colors.grey[100],
                      child: selectedCategory.buildContent(widget.country),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final CountryCategory selectedCategory;
  final Function(CountryCategory) onCategorySelected;
  final bool showAppBar; // Add this parameter to control AppBar visibility

  CategoryHeaderDelegate({
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.showAppBar, // Pass the flag to determine AppBar visibility
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
    return Material(
      // Wrap with Material to ensure decoration applies correctly
      elevation: showAppBar ? 4 : 0, // Optional shadow for smooth effect
      color: Colors.white, // Ensure background color applies correctly
      borderRadius: BorderRadius.vertical(top: Radius.circular(showAppBar ? 0 : 16)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: CountryCategory.values.map((category) {
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
                        fontWeight: selectedCategory == category
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectedCategory == category
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
