// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:Nexus/screens/auth/signup.dart';
import 'package:Nexus/screens/home/home.dart';
import 'dart:ui';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
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
            //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
            color: Color(0xFF3B3084),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 60),
          color: Color(0xFF747EF5),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF453F87),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              Positioned.fill(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                              "Welcome Back 👋",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'arial',
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                buildEmailField(),
                                SizedBox(height: 30),
                                buildPasswordField(),
                                SizedBox(height: 30),
                                MaterialButton(
                                  elevation: 10,
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => Home(),),);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Please fill in all fields'),
                                        ),
                                      );
                                    }
                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
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
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 3),
                              MaterialButton(
                                elevation: 10,
                                onPressed: () {
                                  TextEditingController phoneNumberController = TextEditingController(); // Create a new controller
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SignupPage(phoneNumberController: phoneNumberController)),);
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontFamily: 'arial',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3 - 45,
                                  height: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "or Login With",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3 - 45,
                                  height: 2,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          IconButton(
                            onPressed: () {
                              // Do something
                            },
                            icon: Container(
                              width: 48,
                              height: 48,
                              child: Image.asset('assets/google_icon.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Email';
            }
            return null;
          },
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 103, 96, 185).withOpacity(0.7),
            filled: true,
            hintText: "Enter your Email",
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorStyle: TextStyle(color: Colors.orange),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        width: 5,
                      ),
                    ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),),
            MaterialButton(
              elevation: 10,
              onPressed: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: Text(
                "Forget Password?",
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'arial',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: passwordVisible,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 103, 96, 185).withOpacity(0.7),
            filled: true,
            hintText: "Enter your Password",
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorStyle: TextStyle(color: Colors.orange),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF747EF5)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    passwordVisible ? "Show" : "Hide",
                    style: TextStyle(
                      color: Color.fromARGB(255, 172, 179, 248),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),),
                  // Icon(
                  // passwordVisible ? Icons.visibility : Icons.visibility_off,
                  // color: Colors.grey,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}