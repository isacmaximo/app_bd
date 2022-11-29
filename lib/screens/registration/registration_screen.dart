import 'package:app_bd/components/custom_button.dart';
import 'package:app_bd/components/custom_dialog.dart';
import 'package:app_bd/components/custom_input.dart';
import 'package:app_bd/components/hide_keyboard.dart';
import 'package:app_bd/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    Size size = MediaQuery.of(context).size;
    return HideKeyboardWrapper(
      currentFocus: FocusScope.of(context),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Registrar Livro'),
            leading: IconButton(
                onPressed: () {
                  controller.clearFiels();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)),
            centerTitle: true,
            backgroundColor: Colors.purple[700]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Center(
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: Colors.purple,
                      size: size.height * 0.15,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomInput(
                      title: 'Autor do livro:',
                      validatorMessage: controller.validatorAuthor,
                      controller: controller.authorController),
                  CustomInput(
                      title: 'Título do livro:',
                      validatorMessage: controller.validatorName,
                      controller: controller.nameController),
                  CustomInput(
                      title: 'Categoria do livro:',
                      validatorMessage: controller.validatorCategory,
                      controller: controller.categoryController),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CustomButton(
                    title: 'Salvar Livro',
                    onPressed: () {
                      controller.showSaveDialog(context);
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
