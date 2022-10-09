import 'package:app_bd/components/custom_card_initial.dart';
import 'package:app_bd/controllers/home_controller.dart';
import 'package:app_bd/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../catalog/catalog_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Bem-vindo ao sistema!\nEscolha uma opção abaixo:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomCardInitial(
                  title: 'Catálogo de Livros',
                  icon: Icons.import_contacts,
                  onPressed: () {
                    controller.getBook();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CatalogScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomCardInitial(
                  title: 'Registrar Livro',
                  icon: Icons.save,
                  onPressed: () {
                    controller.clearFiels();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
