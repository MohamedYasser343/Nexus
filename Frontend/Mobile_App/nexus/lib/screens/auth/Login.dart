// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names, use_key_in_widget_constructors
import 'package:Nexus/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/screens/auth/signup.dart';
import 'package:Nexus/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:Nexus/constants/colors.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: colors.secondary,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage()),);
            //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
            color: colors.primary2,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        color: colors.secondary,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.primary2,
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
                              color: colors.textwhite,
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
                                    Navigator.push(context,CupertinoPageRoute(builder: (context) => Home(),),);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                          Text('Please fill in all fields'),
                                      ),
                                    );
                                  }
                                },
                                color: colors.lightcontainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: colors.primary,
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
                                color: colors.textwhite,
                              ),
                            ),
                            SizedBox(width: 3),
                            MaterialButton(
                              elevation: 10,
                              onPressed: () {
                                TextEditingController phoneNumberController = TextEditingController(); // Create a new controller
                                Navigator.push(context,CupertinoPageRoute(builder: (context) => SignupPage(phoneNumberController: phoneNumberController)),);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontFamily: 'arial',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: colors.textwhite,
                                  decoration: TextDecoration.underline,
                                  decorationColor: colors.textwhite,
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
                                width: MediaQuery.of(context).size.width / 3 - 60,
                                height: 2,
                                color: colors.divider,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),),
                            Text(
                              "or Login With",
                              style: TextStyle(
                                color: colors.textwhite,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5),),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3 - 60,
                                height: 2,
                                color: colors.divider,
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
                            child: Image.asset('assets/icons/google_icon.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              color: colors.textwhite,
            ),
            SizedBox(width: 5),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: colors.textwhite,
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
          cursorColor: colors.textwhite,
          style: TextStyle(
            color: colors.textwhite,
          ),
          decoration: InputDecoration(
            fillColor: colors.secondary.withOpacity(0.7),
            filled: true,
            hintText: "Enter your Email",
            hintStyle: TextStyle(
              color: colors.textwhite.withOpacity(0.7),
              fontSize: 12,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: TextStyle(color: colors.error),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
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
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: colors.textwhite,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: colors.textwhite,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              elevation: 10,
              onPressed: () {
                //Navigator.push(context,CupertinoPageRoute(builder: (context) => SignupPage()));
              },
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  fontFamily: 'arial',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: colors.textwhite,
                  decoration: TextDecoration.underline,
                  decorationColor: colors.textwhite,
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
          cursorColor: colors.textwhite,
          style: TextStyle(
            color: colors.textwhite,
          ),
          obscureText: passwordVisible,
          decoration: InputDecoration(
            fillColor: colors.secondary.withOpacity(0.7),
            filled: true,
            hintText: "Enter your Password",
            hintStyle: TextStyle(
              color: colors.textwhite.withOpacity(0.7),
              fontSize: 12,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: TextStyle(color: colors.error),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
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
                      color: colors.accent2.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(width: 2,),
                  // Icon(
                  // passwordVisible ? Icons.visibility : Icons.visibility_off,
                  // color: colors.divider,
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