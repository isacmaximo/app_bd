import 'package:app_bd/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Filtro',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        PopupMenuButton<OrderOptions>(
          color: Colors.blueGrey,
          icon: const Icon(
            Icons.filter_alt,
            color: Colors.blueGrey,
            size: 30,
          ),
          itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
            //popup(A a Z)
            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.titleaz,
              child: Text(
                "Ordenar título de A-Z",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            //popup(Z a A)
            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.titleza,
              child: Text("Ordenar título de Z-A",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.authoraz,
              child: Text("Ordenar autor de A-Z",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.authorza,
              child: Text("Ordenar autor de Z-A",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.categoryaz,
              child: Text("Ordenar categoria de A-Z",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const PopupMenuItem<OrderOptions>(
              value: OrderOptions.categoryza,
              child: Text("Ordenar categoria de Z-A",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
          onSelected: (orderOptions) {
            controller.filterBook(orderOptions);
          },
        ),
      ],
    );
  }
}
