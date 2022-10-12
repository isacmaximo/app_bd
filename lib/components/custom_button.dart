import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final dynamic onPressed;
  final Size? otherSize;
  const CustomButton(
      {super.key, required this.title, this.onPressed, this.otherSize});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.purple,
            minimumSize:
                otherSize ?? Size(size.width * 0.5, size.height * 0.06)),
        child: Text(
          title,
          style: TextStyle(fontSize: size.width * 0.04),
        ));
  }
}
