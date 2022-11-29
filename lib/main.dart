import 'package:app_bd/controllers/home_controller.dart';
import 'package:app_bd/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter SQLite',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
