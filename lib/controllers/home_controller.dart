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
  final searchKey = GlobalKey<FormState>();
  //controllers dos inputs
  TextEditingController authorController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  //controller da searchbar
  TextEditingController searchController = TextEditingController();

  //função que limpa os campos
  clearFiels() {
    authorController.clear();
    nameController.clear();
    categoryController.clear();
    notifyListeners();
  }

  //função que limpa a barra de pesquisa
  clearSearchBar() {
    searchController.clear();
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

  //função de esconder o teclado
  void hideKeyboard(FocusScopeNode currentFocus) {
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  //função para organizar os ítens e retornar a lista na ordem (Filtro)
  filterBook(OrderOptions result) {
    var resultList = ordItems(result, listBook);
    listBook = resultList;
    notifyListeners();
  }

  //função de pesquisar (barra de pesquisa)
  searchTitle(String search) async {
    listBook.clear();
    isLoading = true;
    notifyListeners();
    final allRows = await dbHelper.queryAllRows();
    if (allRows.isEmpty) {
      isLoading = false;
      notifyListeners();
    } else {
      for (var row in allRows) {
        if (row['name']
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          listBook.add(Book(
              id: row['_id'],
              author: row['author'],
              name: row['name'],
              category: row['category']));
        }
      }
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  //variável que indica estado de carregamento
  bool isLoading = false;

  //verificação
  bool validate = false;
  //frases de validação
  String validatorAuthor = 'Nome do autor é obrigatório!';
  String validatorName = 'Nome do livro é obrigatório!';
  String validatorCategory = 'Categoria do livro é obrigatória!';

  //instancia do banco de dados (SQLite)
  final dbHelper = DB.instance;

  //função de inserir livros
  void insertBook() async {
    // linha para incluir
    Map<String, dynamic> row = {
      DB.columnAuthor: authorController.text,
      DB.columnName: nameController.text,
      DB.columnCategory: categoryController.text
    };
    await dbHelper.insert(row);
    notifyListeners();
  }

  //função de deletar um livro
  deleteBook(int? id) async {
    await dbHelper.delete(id!);
    getBook();
    notifyListeners();
  }

  //função de atualizar um livro
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

  //função de carregar os livros cadastrados
  void getBook() async {
    listBook.clear();
    isLoading = true;
    notifyListeners();
    final allRows = await dbHelper.queryAllRows();
    if (allRows.isEmpty) {
      //print('Lista vazia');
      isLoading = false;
      notifyListeners();
    } else {
      for (var row in allRows) {
        listBook.add(Book(
            id: row['_id'],
            author: row['author'],
            name: row['name'],
            category: row['category']));
      }
      isLoading = false;
      notifyListeners();
    }

    //listBook.add(value)
    //print('Consulta todas as linhas:');
    //allRows.forEach((row) => print(row));
    notifyListeners();
  }
}
