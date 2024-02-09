// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailField = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Stack(
        children: [
          Container(
            color: Color(0xFF747EF5),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/dark_shape.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        inputFile(
                          label: isEmailField ? "Email" : "Password",
                          hint: isEmailField ? "Enter your Email" : "Enter your Password",
                        ),
                        SizedBox(height: 30),
                        inputFile(
                          label: isEmailField ? "Password" : "Email", 
                          obscureText: !isEmailField,
                          hint: isEmailField ? "Enter your Password" : "Enter your Email",
                        ),
                        SizedBox(height: 30),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 60,
                          height: 60,
                          onPressed: () {
                            setState(() {
                              isEmailField = !isEmailField;
                            });
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFF3B3084),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",
                      style: 
                        TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(" Sign up",
                      style: 
                        TextStyle(
                          fontWeight: 
                            FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget inputFile({label, obscureText = false, hint}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
}
