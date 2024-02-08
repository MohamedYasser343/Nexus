// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF747EF5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Color(0xFF3B3084),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF747EF5),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Welcome Back 👋 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'arial',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height - (56 + 21 + 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/dark_shape.png'),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
