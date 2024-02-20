// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Color(0xFF747EF5),
          ),
        ),
      ],
    );
  }
}