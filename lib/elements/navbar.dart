import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/Pages/Searchpage.dart';
import 'package:newsy/Pages/home.dart';
import 'package:newsy/Pages/info.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Outer container is transparent
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.darkText.withOpacity(0.8),
            border: Border.all(color: AppColors.darkBackground),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                icon: Icon(Icons.home_filled),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchpage()),
                  );
                },
                icon: Icon(Icons.search_rounded),
              ),
              IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
              }, icon: Icon(Icons.person_2_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
