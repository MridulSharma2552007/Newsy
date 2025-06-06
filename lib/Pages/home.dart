import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/elements/navbar.dart';
import 'package:newsy/service/service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<dynamic> articles = [];
  final List<String> topics = [
    'General',
    'Sports',
    'Business',
    'Science',
    'Technology',
    'Entertainment',
  ];
  String selectedTopic = 'General';
  @override
  void initState() {
    loadNews();
    super.initState();
  }

  Future<void> loadNews() async {
    try {
      final fetchArticles = await Service.fetchNewsByCategory(selectedTopic);
      setState(() {
        articles = fetchArticles;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 1000,
              child: Column(
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
                                  loadNews();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  topic,
                                  style: TextStyle(
                                    fontSize: isSelected ? 35 : 28,
                                    color:
                                        isSelected
                                            ? AppColors.tertiory
                                            : Colors.white,
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
                  Expanded(
                    child:
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : SizedBox(
                              height: 300,
                              child: ListView.builder(
                                itemCount: articles.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final article = articles[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      height: 300,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  article['urlToImage'] ?? '',

                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              placeholder:
                                                  (context, url) => Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                    Icons.broken_image,
                                                    size: 150,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              article['title'] ?? 'No Title',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: AppColors.darkBackground,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              article['author'] ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black,

                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 200,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  article['description'] ?? '',
                                                  maxLines: 7,

                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.darkPrimary,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(bottom: 20, left: 10, right: 10, child: Navbar()),
        ],
      ),

      // bottomNavigationBar: Navbar(),
    );
  }
}
