// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, unused_import, camel_case_types, sized_box_for_whitespace
import 'package:Nexus/main.dart';
import 'package:flutter/material.dart';
import 'dart:async'; 
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
class splash extends StatefulWidget {
  const splash({super.key});
  @override
  State<splash> createState() => _splashState();
}
class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000)); // Wait for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
    );
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      splash: Container(
        width: 1000,
        height: 1000,
        //child: Image.asset('assets/splash_base.png'),
      ),
      nextScreen: Container(), // Placeholder screen
      //splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Color(0xFF747EF5),
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}
