// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF202020),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios_rounded,
        //     size: 35,
        //     color: Colors.white.withOpacity(0.4)),
        //   ),
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