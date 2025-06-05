import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/elements/serachbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchText = '';
  void updateSeatchText(String newtext) {
    setState(() {
      searchText = newtext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
            child: Serachbox(onSearch: updateSeatchText),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Search Results For $searchText',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
