import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> topics = [
    'Trending',
    'Sports',
    'Business',
    'Science',
    'Technology',
    'Entertainment',
  ];
  String selectedTopic = 'Trending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Newsy',
                style: TextStyle(
                  color: AppColors.quad,
                  fontSize: 60,
                  fontFamily: 'Pilowlava',
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  topics.map((topic) {
                    final isSelected = selectedTopic == topic;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTopic = topic;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          topic,
                          style: TextStyle(
                            fontSize: isSelected ? 35 : 28,
                            color:
                                isSelected ? AppColors.tertiory : Colors.white,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
