import 'package:app_bd/models/book.dart';
import 'package:app_bd/db.dart';
import 'package:flutter/cupertino.dart';

//enum de opções do filtro
enum OrderOptions {
  titleaz,
  titleza,
  authoraz,
  authorza,
  categoryaz,
  categoryza
}

class HomeController extends ChangeNotifier {
  //key
  final formKey = GlobalKey<FormState>();
  TextEditingController authorController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  clearFiels() {
    authorController.clear();
    nameController.clear();
    categoryController.clear();
    notifyListeners();
  }

  //lista de livros a ser carregada
  List<Book> listBook = [];

  //funções de ordenar (escolha do tipo de ordenação)
  ordItems(OrderOptions result, List<Book> list) {
    switch (result) {
      case OrderOptions.titleaz:
        list.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;

      case OrderOptions.titleza:
        list.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;

      case OrderOptions.authoraz:
        list.sort((a, b) {
          return a.author.toLowerCase().compareTo(b.author.toLowerCase());
        });
        break;

      case OrderOptions.authorza:
        list.sort((a, b) {
          return b.author.toLowerCase().compareTo(a.author.toLowerCase());
        });
        break;

      case OrderOptions.categoryaz:
        list.sort((a, b) {
          return a.category.toLowerCase().compareTo(b.category.toLowerCase());
        });
        break;

      case OrderOptions.categoryza:
        list.sort((a, b) {
          return b.category.toLowerCase().compareTo(a.category.toLowerCase());
        });
        break;
    }

    return list;
  }

  //função para organizar os ítens e retornar a lista na ordem (Filtro)
  filterBook(OrderOptions result) {
    var resultList = ordItems(result, listBook);
    listBook = resultList;
    notifyListeners();
  }

  bool isLoading = false;

  bool confirmDelete = false;

  void notify() {
    notifyListeners();
  }

  //verificação
  bool validate = false;
  String validatorAuthor = 'Nome do autor é obrigatório!';
  String validatorName = 'Nome do livro é obrigatório!';
  String validatorCategory = 'Categoria do livro é obrigatória!';

  final dbHelper = DB.instance;

  void insertBook() async {
    // linha para incluir
    Map<String, dynamic> row = {
      DB.columnAuthor: authorController.text,
      DB.columnName: nameController.text,
      DB.columnCategory: categoryController.text
    };
    final id = await dbHelper.insert(row);
    notifyListeners();
  }

  deleteBook(int? id) async {
    await dbHelper.delete(id!);
    getBook();
    notifyListeners();
  }

  void updateBook(int? id) async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DB.columnId: id,
      DB.columnAuthor: authorController.text,
      DB.columnName: nameController.text,
      DB.columnCategory: categoryController.text
    };
    await dbHelper.update(row);
    getBook();
    notifyListeners();
  }

  void getBook() async {
    listBook.clear();
    isLoading = true;
    final allRows = await dbHelper.queryAllRows();
    if (allRows.isEmpty) {
      print('Lista vazia');
    } else {
      for (var row in allRows) {
        listBook.add(Book(
            id: row['_id'],
            author: row['author'],
            name: row['name'],
            category: row['category']));
      }
      isLoading = false;
    }

    //listBook.add(value)
    //print('Consulta todas as linhas:');
    //allRows.forEach((row) => print(row));
    notifyListeners();
  }
}
