// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_import, unused_import
import 'package:Nexus/screens/auth/Login.dart';
import 'package:Nexus/screens/auth/signup.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:Nexus/screens/splash/splash.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart'; 
import 'dart:async'; 
void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: 
      AnimatedSplashScreen( // to open the splash page first, this widget controls what you see before home page
        duration: 3500,
        splash:
        Expanded(// to fit on any device
          child: 
            Container(
              child: 
                Image.asset('assets/splash_animation.gif',
                  fit: BoxFit.contain,
                ),
            ),
          ),
        nextScreen: HomePage(),
        backgroundColor: Color(0xFF747EF5),
        pageTransitionType: PageTransitionType.fade,
        ),
    ),
  );
}
class HomePage extends StatelessWidget {
  //final String title; //used to set a title to connect the splash screen with main screen
  //const HomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF747EF5),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          color: Color(0xFF747EF5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/nexus.png'),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            Column(
              children: <Widget>[
                // the log in button
                MaterialButton(
                  elevation: 10,
                  minWidth: double.infinity,
                  height: 60.0,
                  color:  Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xFF3B3084)
                    ),
                    borderRadius: BorderRadius.circular(50)
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
                // the difference between the two buttons
                SizedBox(height: 20,),
                //the sign up button
                MaterialButton(
                  elevation: 10,
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  color: Color(0xFF3B3084),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(50)
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
            )
            ],
          ),
        ),)
    );
  }
}
//this section helps me determine some things faster:
//
//icon: Icon(Icons.,
//
//MaterialButton(
//  onPressed: () {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//  },
//   onPressed: (() => something(somewhere)),
//   child:
// )