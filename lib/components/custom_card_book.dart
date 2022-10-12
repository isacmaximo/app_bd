import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class CustomCardBook extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final dynamic onEdit;
  final dynamic onDelete;
  const CustomCardBook(
      {super.key,
      this.onEdit,
      required this.title,
      required this.author,
      required this.category,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.015),
      width: size.width * 0.8,
      height: size.height * 0.27,
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
        color: Colors.black87,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.01,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: Column(
          children: [
            RowBookInfo(title: title, indicator: 'Título: ', icon: Icons.book),
            SizedBox(
              height: size.height * 0.0025,
            ),
            RowBookInfo(
                title: author, indicator: 'Autor: ', icon: Icons.person),
            SizedBox(
              height: size.height * 0.0025,
            ),
            RowBookInfo(
                title: category,
                indicator: 'Categoria: ',
                icon: Icons.category),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                  child: IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit,
                        size: size.width * 0.056,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                  child: IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        size: size.width * 0.056,
                        color: Colors.white,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RowBookInfo extends StatelessWidget {
  final String title;
  final String indicator;
  final IconData icon;
  const RowBookInfo(
      {super.key,
      required this.title,
      required this.icon,
      required this.indicator});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          indicator,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: TextScroll(
            title,
            mode: TextScrollMode.bouncing,
            velocity: const Velocity(pixelsPerSecond: Offset(25, 0)),
            delayBefore: const Duration(milliseconds: 1000),
            pauseBetween: const Duration(milliseconds: 500),
            style: const TextStyle(
                fontSize: 18,
                overflow: TextOverflow.visible,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.right,
            selectable: true,
          ),
        ),
      ],
    );
  }
}
