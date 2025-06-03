import 'package:flutter/material.dart';
import 'package:newsy/Pages/splashScreen.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),

  ));
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splashscreen(),
    );
  }
}