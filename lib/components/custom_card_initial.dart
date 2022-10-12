import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCardInitial extends StatelessWidget {
  final String title;
  final dynamic onPressed;
  final IconData icon;
  const CustomCardInitial(
      {super.key, required this.title, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(213, 231, 246, 1),
                offset: Offset(0, 1),
                blurRadius: 4)
          ],
          color: Colors.purple[700],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.02,
              bottom: size.height * 0.01,
              left: size.width * 0.05,
              right: size.width * 0.05),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: size.width * 0.055,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Icon(
                icon,
                color: Colors.white,
                size: size.height * 0.2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
