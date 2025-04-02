import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KeyInfoScreen extends StatelessWidget {
  const KeyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            description("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et..."),

            capitalItem("Algiers"),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(10, (index) => city("City$index${index+1}")),
            ),

            labelResponse("Official Language(s)", "Arabic, Amazigh"),

            labelResponse("Currency", "Algerian dinar"),

            labelResponse("Major Religions", "Islam"),

            labelResponse("Dial Code", "+213")
          ],
        ),
    );
  }

  Column labelResponse(String label, String response) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                response,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              ]
          );
  }

  Container city(String name) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
            ),
          );
  }

  Column capitalItem(String capital) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Capital City",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 7, // 70% of the Row
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                      ),
                      alignment: Alignment.centerLeft, // Center vertically, align left
                      padding: EdgeInsets.only(left: 16), // Add left padding
                      child: Text(
                        capital,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3, // 30% of the Row
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                      ),
                      height: 70,
                      child: Center(
                        child: SvgPicture.asset(
                          "lib/core/assets/pin.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  Column description(description) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),

        Divider(),
      ],
    );
  }
}
