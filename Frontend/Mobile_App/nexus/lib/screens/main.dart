// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_import, unused_import, avoid_unnecessary_containers, use_key_in_widget_constructors, depend_on_referenced_packages
import 'package:Nexus/screens/auth/Login.dart';
import 'package:Nexus/screens/auth/signup.dart';
import 'package:Nexus/screens/home/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart'; 
import 'package:Nexus/splash.dart';
import 'dart:async'; 
import 'package:flutter/cupertino.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3500,
        splash: Expanded(
          child: Container(
            child: Image.asset(
              'assets/splash_animation.gif',
              fit: BoxFit.contain,
            ),
          ),
        ),
        backgroundColor: Color(0xFF747EF5),
        nextScreen: HomePage(),
        pageTransitionType: PageTransitionType.fade,
      ),
    ),
  );
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Color(0xFF747EF5),
          ),
        ),
        Positioned(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF747EF5),
            elevation: 0,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/nexus.png'),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                SizedBox(height: 300),
                MaterialButton(
                  elevation: 10,
                  minWidth: double.infinity,
                  height: 60.0,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => Home()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2.0, color: Color(0xFF3B3084)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B3084),
                      fontSize: 24,
                      fontFamily: 'arial',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 10,
                  minWidth: double.infinity,
                  height: 60.0,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2.0, color: Color(0xFF3B3084)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B3084),
                      fontSize: 24,
                      fontFamily: 'arial',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 10,
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    TextEditingController phoneNumberController = TextEditingController(); // Create a new controller
                    Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => SignupPage(phoneNumberController: phoneNumberController)),);
                  },
                  color: Color(0xFF3B3084),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: 'arial',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
/*
icon: Icon(Icons.,

MaterialButton(
  onPressed: () {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
  },
  onPressed: (() => something(somewhere)),
  child:
)

Padding(
  padding: EdgeInsets.symmetric(horizontal: 5),
),

Padding(
  padding: EdgeInsets.symmetric(horizontal: 15),
  child: Container(
    width: MediaQuery.of(context).size.width / 3 - 45,
    height: 2,
    color: Colors.grey,
  ),
),

*/