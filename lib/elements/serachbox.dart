import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';

class Serachbox extends StatefulWidget {
  final Function(String) onSearch;
  const Serachbox({super.key, required this.onSearch});

  @override
  State<Serachbox> createState() => _SerachboxState();
}

class _SerachboxState extends State<Serachbox> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void handleSearch() {
    final String searchText = _textFieldController.text;
    widget.onSearch(searchText);
    print('Searching for: $searchText');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.darkPrimary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onSubmitted: (value) => handleSearch(),
              controller: _textFieldController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '     Search for topics',
                hintStyle: TextStyle(color: AppColors.quad),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),

        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.darkPrimary,
          ),
          child: Icon(Icons.search, color: AppColors.secondary),
        ),
      ],
    );
  }
}
