import 'package:flutter/material.dart';

class TajetasProductosServicios extends StatefulWidget {
  TajetasProductosServicios({Key? key}) : super(key: key);

  @override
  State<TajetasProductosServicios> createState() => _TajetasProductosServiciosState();
}

class _TajetasProductosServiciosState extends State<TajetasProductosServicios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 5.0, right: 10.0),
              child: Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Image.asset('assets/images/B5.png',
                          height: 120, width: 120),
                    ),
                    const Text(
                      'Productos',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
              child: Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 160, 153, 153),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Image.asset('assets/images/B1.png',
                          height: 120, width: 120),
                    ),
                    const Text(
                      'Servicios',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
