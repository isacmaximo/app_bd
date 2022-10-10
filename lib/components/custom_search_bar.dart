import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class CustomSearchBar extends StatefulWidget {
  final TextInputType? keybordType;
  final TextEditingController? controller;
  final dynamic function;
  final dynamic function2;
  final bool isSearch;
  const CustomSearchBar(
      {super.key,
      this.keybordType,
      this.controller,
      this.function,
      this.function2,
      required this.isSearch});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = context.watch<HomeController>();
    return Row(
      children: [
        IconButton(
            onPressed: widget.function2,
            icon: const Icon(
              Icons.cancel,
              color: Colors.blueGrey,
            )),
        Container(
            //padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            padding: const EdgeInsets.only(left: 12),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            width: size.width * 0.5,
            height: size.height * 0.05,
            child: TextFormField(
                cursorColor: Colors.black,
                controller: widget.controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Pesquisar título',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.manage_search_rounded,
                        color: Colors.blueGrey,
                      ),
                      onPressed: widget.function,
                    )))),
      ],
    );
  }
}
