import 'package:flutter/material.dart';
import 'package:flutter_food/views/detail/food_detail_page.dart';

class CardFood extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final double imageWidth;
  final double imageHeight;

  CardFood({
    required this.imageAsset,
    required this.title,
    this.description = '',
    this.imageWidth = 200,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(),
            // settings: RouteSettings(arguments: yourData),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                imageAsset,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
