import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

class LabeledLink extends StatelessWidget {
  const LabeledLink({
    super.key,
    required this.link,
    required this.primLabel,
    required this.secLabel,
    required this.icon,
    required this.imagePath,
  });

  final String imagePath;
  final String link;
  final String primLabel;
  final String secLabel;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 7, // 70% of the Row
            child: Stack(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        imagePath, // imagePath now should be a URL string
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8),
                    ),
                  ),
                  alignment:
                      Alignment.centerLeft, // Center vertically, align left
                  padding: EdgeInsets.all(12), // Add left padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        primLabel,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        secLabel,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3, // 30% of the Row
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(8),
                ),
              ),
              height: 90,
              child: Center(
                child: SvgPicture.asset(
                  "lib/core/assets/$icon.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      );
  }
}
