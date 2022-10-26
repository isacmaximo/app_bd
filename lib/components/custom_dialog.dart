import 'package:app_bd/components/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final dynamic onPressed;
  const CustomDialog(
      {super.key, required this.title, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: size.width * 0.8,
        height: size.width <= 360 ? size.height * 0.265 : size.height * 0.25,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(213, 231, 246, 1),
                offset: Offset(0, 1),
                blurRadius: 4)
          ],
          color: Colors.white,
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
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              CustomButton(
                title: 'Ok',
                onPressed: onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  final String title;
  final String message;
  final dynamic onConfirm;
  final dynamic onCancel;
  const CustomDialog2(
      {super.key,
      required this.title,
      required this.message,
      this.onConfirm,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: size.width * 0.8,
        height: size.width <= 360 ? size.height * 0.28 : size.height * 0.25,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(213, 231, 246, 1),
                offset: Offset(0, 1),
                blurRadius: 4)
          ],
          color: Colors.white,
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
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    title: 'Confirmar',
                    otherSize: Size(size.width * 0.25, size.height * 0.06),
                    onPressed: onConfirm,
                  ),
                  CustomButton(
                    title: 'Cancelar',
                    otherSize: Size(size.width * 0.25, size.height * 0.06),
                    onPressed: onCancel,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
