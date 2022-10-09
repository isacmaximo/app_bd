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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog2(
                        title: 'Deseja realmente\ndeletar este livro?',
                        message: 'Essa ação não pode ser desfeita',
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                        onConfirm: () {
                          Navigator.of(context).pop();
                          controller.deleteBook(listBook[index].id);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Livro excluído com sucessso!',
                                  message: 'Alteração de catálogo concluída!',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              });
                        },
                      );
                    });
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
