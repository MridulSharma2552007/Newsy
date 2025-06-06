import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
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
          ],
        ),
      ),
    );
  }
}
