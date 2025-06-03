import 'package:flutter/material.dart';
import 'package:newsy/elements/category.dart';
import 'package:newsy/elements/searchbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 40),
          Searchbar(),
          SizedBox(height: 40),
          Category(),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
