import 'package:flutter/material.dart';
import 'package:newsy/elements/categorychip.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Give it a fixed height
      height: 216,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16), 
                CategoryChip(title: 'Sports', imagePath: 'assets/sports.jpg'),
                CategoryChip(
                  title: 'Business',
                  imagePath: 'assets/Business.jpg',
                ),
                CategoryChip(
                  title: 'Entertainment',
                  imagePath: 'assets/Entertainment.jpg',
                ),

                SizedBox(width: 16), // Optional: spacing from right
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CategoryChip(title: 'Health', imagePath: 'assets/health.jpg'),
                CategoryChip(
                  title: 'Technology',
                  imagePath: 'assets/Technology.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
