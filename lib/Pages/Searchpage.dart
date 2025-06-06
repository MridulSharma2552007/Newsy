import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/elements/navbar.dart';
import 'package:newsy/elements/serachbox.dart';
import 'package:newsy/service/service.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _Searchpage();
}

class _Searchpage extends State<Searchpage> {
  List<dynamic> articles = [];
  bool isLoading = true;
  String searchText = '';
  void updateSeatchText(String newtext) {
    setState(() {
      searchText = newtext;
      isLoading = true;
    });
    loadnews();
  }

  Future<void> loadnews() async {
    try {
      final fetchedarticles = await Service.fetchNewsBySearching('$searchText');
      setState(() {
        articles = fetchedarticles;
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
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          Column(
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
              Expanded(
                child:
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: articles.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  color: AppColors.tertiory,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl: article['urlToImage'] ?? '',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
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
                                          scrollDirection: Axis.vertical,
                                          child: Text(
                                            article['description'] ?? '',
                                            maxLines: 7,

                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppColors.darkPrimary,
                                              fontWeight: FontWeight.normal,
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
            ],
          ),
          Positioned(bottom: 20, left: 10, right: 10, child: Navbar()),
        ],
      ),
    );
  }
}
