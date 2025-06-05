import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/elements/serachbox.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _Searchpage();
}

class _Searchpage extends State<Searchpage> {
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
