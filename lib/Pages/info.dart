import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/Pages/apicheck.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController apiController = TextEditingController();

  @override
  void dispose() {
    apiController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
      }
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
    }
  }

  Future<void> saveapi() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_key', apiController.text.trim());
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('API key saved')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        title: const Text('About Newsy', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              '📰 Newsy',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Newsy is a beautifully designed news app built using Flutter. It brings you trending headlines and updates from various categories like Sports, Technology, Business, and more.\n\nBuilt with ❤️ by Mridul Sharma.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.white),
              title: const Text(
                'View Source Code',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _launchURL("https://github.com/MridulSharma2552007"),
            ),
            ListTile(
              leading: const Icon(
                Icons.bug_report_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Give Feedback (Fork or Issue)',
                style: TextStyle(color: Colors.white),
              ),
              onTap:
                  () => _launchURL(
                    "https://github.com/MridulSharma2552007/Newsy/issues",
                  ),
            ),
            ListTile(
              leading: const Icon(Icons.cloud_download, color: Colors.white),
              title: const Text(
                'Download WeatherZen App',
                style: TextStyle(color: Colors.white),
              ),
              onTap:
                  () => _launchURL(
                    "https://drive.google.com/file/d/1dBXlX8z4icY-fkv4S4aFA9Dg1LStThwW/view",
                  ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: saveapi,
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
                child: const Text(
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
    );
  }
}
