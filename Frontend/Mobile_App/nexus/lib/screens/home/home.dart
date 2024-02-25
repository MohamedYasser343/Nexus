// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  bool UserGender = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color(0XFF202020),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
            color: Colors.white.withOpacity(0.4)),
          ),
        actions: <Widget>[
          if (UserGender = true)
            IconButton(
              icon: Image.asset('assets/male_user_pp.png'), // Replace 'your_image.png' with the path to your image asset
              onPressed: () {
                // Add your image action logic here
              },
            )
            else 
              IconButton(
                icon: Image.asset('assets/female_user_pp.png'), // Replace 'your_image.png' with the path to your image asset
                onPressed: () {
                  // Add your image action logic here
                },
              ),
        ],
        ),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        color: Color(0xFF2B2B2B),
        child: Stack(
          
        )
        )
      );
  }
}