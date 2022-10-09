import 'package:app_bd/components/custom_filter.dart';
import 'package:app_bd/components/list_book.dart';
import 'package:app_bd/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Catálogo de Livros'),
          centerTitle: true,
          backgroundColor: Colors.purple[700]),
      body: controller.listBook.isEmpty
          ? const Center(
              child: Text(
                'Nenhum livro registrado!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : SingleChildScrollView(
              child: controller.isLoading == true
                  ? Transform.scale(
                      scale: 3,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ))
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.0,
                          ),
                          //filtro
                          const CustomFilter(),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          //listra de livros
                          SizedBox(
                            height: size.height * 0.78,
                            child: ListBook(
                              listBook: controller.listBook,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
    );
  }
}
