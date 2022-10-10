import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String validatorMessage;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const CustomInput(
      {Key? key,
      required this.title,
      required this.controller,
      this.keyboardType,
      required this.validatorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: Colors.black,
          controller: controller,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: Colors.purple)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
