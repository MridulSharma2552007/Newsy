import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Apicheck extends StatefulWidget {
  const Apicheck({super.key});

  @override
  State<Apicheck> createState() => _ApicheckState();
}

final TextEditingController apiController = TextEditingController();

class _ApicheckState extends State<Apicheck> {
  Future<void> openNewsApi() async {
    final Uri url = Uri.parse("https://newsapi.org/");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  Future<void> saveapi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('api_key', apiController.text);
  }

  Future<void> checkandpush() async {}

  Future<void> checkapi() async {
    if (apiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter API key.',
            style: TextStyle(color: AppColors.tertiory),
          ),
          backgroundColor: AppColors.darkPrimary,
        ),
      );
      return;
    }
    saveapi();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Container(
          height: 650,
          width: 350,
          decoration: BoxDecoration(
            color: AppColors.darkPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                Center(
                  child: Text(
                    'Enter your API Key',
                    style: TextStyle(
                      color: AppColors.tertiory,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "How to get your API Key:",
                  style: TextStyle(
                    color: AppColors.tertiory,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "1. Go to ",
                      style: TextStyle(
                        color: AppColors.tertiory.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),

                    InkWell(
                      onTap: openNewsApi,
                      child: Text(
                        "https://newsapi.org/",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  "2. Click on 'Get API Key'.\n"
                  "3. Create a free account.\n"
                  "4. Copy your API key from dashboard.\n"
                  "5. Paste it below.",
                  style: TextStyle(
                    color: AppColors.tertiory.withOpacity(0.8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: apiController,
                  style: TextStyle(color: AppColors.tertiory),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkBackground,
                    hintText: 'Enter API Key',
                    hintStyle: TextStyle(
                      color: AppColors.tertiory.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      checkapi();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
