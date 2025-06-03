import 'package:flutter/material.dart';
import 'package:newsy/Service/news_service.dart';
import 'package:newsy/elements/category.dart';
import 'package:newsy/elements/searchbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> articles = [];
  bool isLoading = true;
  String selectedCategory = 'general';
  final NewsService newsService = NewsService();

  @override
  void initState() {
    fetchNewsbyCategory();
    super.initState();
  }

  String newscat = 'general';

  Future<void> fetchNewsbyCategory() async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetch = await newsService.fetchNews(category: newscat);

      print('Fetched ${fetch.length} articles');
      setState(() {
        isLoading = false;
        articles = fetch;
      });
    } catch (e) {
      print('$e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 40),
            Searchbar(),
            SizedBox(height: 40),
            Category(
              onCategorySelected: (String category) {
                setState(() {
                  newscat = category;
                   print("Selected category: $category"); 
                });
                fetchNewsbyCategory();
              },
            ),

            SizedBox(height: 40),
            SizedBox(height: 20),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final article = articles[index];
                final imageUrl = article['urlToImage'];

                return Card(
                  color: Colors.grey[900],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading:
                        imageUrl != null && imageUrl.isNotEmpty
                            ? Image.network(
                              imageUrl,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                            : Container(
                              width: 100,
                              color: Colors.grey,
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.white54,
                              ),
                            ),
                    title: Text(
                      article['title'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      article['description'] ?? '',
                      style: TextStyle(color: Colors.white70),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
