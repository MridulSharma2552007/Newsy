import 'package:flutter/material.dart';
import 'package:newsy/Pages/apicheck.dart';
import 'package:newsy/Pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacitylevel = 0.0;
  
  Future<void> getvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Apicheck()),
        );
      });
    }
  }

  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          opacitylevel = 1.0;
        });
      }
    });
    getvalue();
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
