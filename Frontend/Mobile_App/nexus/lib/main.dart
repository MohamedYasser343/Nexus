// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:Nexus/Login.dart';
import 'package:Nexus/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),// to open the splash page first
  ));
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                  minWidth: double.infinity,
                  height: 60.0,
                  color:  Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xFF453F87)
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF453F87),
                      fontSize: 24,
                      fontFamily: 'arial',
                    ),
                  ),
                ),
                // the difference between the two buttons
                SizedBox(height: 20,),
                //the sign up button
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  color: Color(0xFF453F87),
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