import 'package:cafe_valdivia/Components/card_almacen.dart';
import 'package:flutter/material.dart';

class Almacen extends StatelessWidget {
  const Almacen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Cardalmacen(titulo: "Verde", cuerpo: "1000kg", footer: ""),
              Cardalmacen(
                titulo: "Molido",
                cuerpo: "17.5kg",
                footer: "10kg 101/2kg 101/4kg",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Cardalmacen(titulo: "Cordoba", cuerpo: "300kg", footer: "300kg"),
              Cardalmacen(titulo: "Bola", cuerpo: "1000kg", footer: ""),
            ],
          ),
        ],
      ),
    );
  }
}
