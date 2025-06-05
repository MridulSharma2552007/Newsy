import 'package:flutter/material.dart';
import 'package:newsy/Colors/colors.dart';
import 'package:newsy/Pages/Searchpage.dart';
import 'package:newsy/Pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacitylevel = 0.0;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          opacitylevel = 1.0;
        });
      }
    });
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 219, 241),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacitylevel,
          duration: const Duration(seconds: 2),

          child: Image.asset('assets/NewsyIcon.png', height: 300),
        ),
      ),
    );
  }
}
