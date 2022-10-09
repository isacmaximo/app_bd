import 'package:app_bd/components/custom_filter.dart';
import 'package:app_bd/components/custom_search_bar.dart';
import 'package:app_bd/components/hide_keyboard.dart';
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

    return HideKeyboardWrapper(
      currentFocus: FocusScope.of(context),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Catálogo de Livros'),
            centerTitle: true,
            backgroundColor: Colors.purple[700]),
        body: /*controller.listBook.isEmpty
            ? controller.isLoading == true
                ? Transform.scale(
                    scale: 3,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple[700],
                        strokeWidth: 3,
                      ),
                    ))
                : const Center(
                    child: Text(
                      'Nenhum livro registrado!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
            :*/
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.0,
                ),
                //filtro
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSearchBar(
                      isSearch: controller.isLoading,
                      controller: controller.searchController,
                      function: () {
                        if (controller.searchController.text.isNotEmpty) {
                          controller
                              .searchTitle(controller.searchController.text);
                          controller.hideKeyboard(FocusScope.of(context));
                        }
                      },
                      function2: () {
                        if (controller.searchController.text.isNotEmpty) {
                          controller.clearSearchBar();
                          controller.getBook();
                          controller.hideKeyboard(FocusScope.of(context));
                        }
                      },
                    ),
                    const CustomFilter(),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //listra de livros
                controller.listBook.isEmpty &&
                        controller.searchController.text.isEmpty
                    ? controller.isLoading == true
                        ? Padding(
                            padding: EdgeInsets.only(top: size.height * 0.3),
                            child: Transform.scale(
                                scale: 3,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.purple[700],
                                    strokeWidth: 3,
                                  ),
                                )),
                          )
                        : const Center(
                            child: Text(
                            'Nenhum livro registrado!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                    : controller.listBook.isEmpty &&
                            controller.searchController.text.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: size.height * 0.3),
                            child: const Text(
                              'Nenhum livro encontrado!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        : SizedBox(
                            height: size.height * 0.78,
                            child: ListBook(
                              listBook: controller.listBook,
                            ),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
