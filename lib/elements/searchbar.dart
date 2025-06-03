import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 34, 34),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.grey[800],

                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search news',

                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none, // NO BORDER WHEN ENABLED
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 34, 34, 34),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }
}
