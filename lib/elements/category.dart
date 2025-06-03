import 'package:flutter/material.dart';
import 'package:newsy/elements/categorychip.dart';

class Category extends StatelessWidget {
  final Function(String) onCategorySelected;

  const Category({super.key, required this.onCategorySelected});

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
                CategoryChip(
                  title: 'Sports',
                  imagePath: 'assets/sports.jpg',
                  onTap: () {
                    onCategorySelected('sports');
                  },
                ),
                CategoryChip(
                  title: 'Business',
                  imagePath: 'assets/Business.jpg',
                  onTap: () {
                    onCategorySelected('business');
                  },
                ),
                CategoryChip(
                  title: 'Entertainment',
                  imagePath: 'assets/Entertainment.jpg',
                  onTap: () {
                    onCategorySelected('entertainment');
                  },
                ),

                SizedBox(width: 16), // Optional: spacing from right
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CategoryChip(
                  title: 'Health',
                  imagePath: 'assets/health.jpg',
                  onTap: () {
                    onCategorySelected('health');
                  },
                ),
                CategoryChip(
                  title: 'Technology',
                  imagePath: 'assets/Technology.jpg',
                  onTap: () {
                    onCategorySelected('technology');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
