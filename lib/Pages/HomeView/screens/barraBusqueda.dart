import 'package:flutter/material.dart';

class BarraBusqueda extends StatefulWidget {
  BarraBusqueda({Key? key}) : super(key: key);

  @override
  State<BarraBusqueda> createState() => _BarraBusquedaState();
}

class _BarraBusquedaState extends State<BarraBusqueda> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              width: 290,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar Producto o Servicio ..',
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.black,
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.tune, size: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
