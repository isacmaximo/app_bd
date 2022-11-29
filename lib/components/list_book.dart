import 'package:app_bd/components/custom_card_book.dart';
import 'package:app_bd/components/custom_dialog.dart';
import 'package:app_bd/edit/edit_screen.dart';
import 'package:app_bd/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class ListBook extends StatelessWidget {
  final List<Book> listBook;

  const ListBook({super.key, required this.listBook});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    return Scrollbar(
      child: ListView.builder(
          itemCount: listBook.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomCardBook(
              title: listBook[index].name,
              author: listBook[index].author,
              category: listBook[index].category,
              onDelete: () {
                controller.showDeleteDialog(context, listBook[index].id);
              },
              onEdit: () {
                controller.authorController.text = listBook[index].author;
                controller.nameController.text = listBook[index].name;
                controller.categoryController.text = listBook[index].category;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditScreeen(
                            id: listBook[index].id,
                          )),
                );
              },
            );
          }),
    );
  }
}
