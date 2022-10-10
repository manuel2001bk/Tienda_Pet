import 'package:flutter/material.dart';
import 'package:tienda_pet_movil/API/Auth.dart';

class BannerNombre extends StatefulWidget {
  BannerNombre({Key? key}) : super(key: key);

  @override
  State<BannerNombre> createState() => _BannerNombreState();
}

class _BannerNombreState extends State<BannerNombre> {
  final Auth _Auth = Auth.instance;
  String nombre = '';
  @override
  void initState() {
    super.initState();
    nombre = _Auth.user!.user!.displayName!;
    nombre = nombre.split(' ')[0];
    setState(() {
      nombre = nombre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: RichText(
                      text: TextSpan(
                          text: 'Hola',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                        TextSpan(
                          text: ' $nombre',
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        const TextSpan(
                          text: ',',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ])),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      Column(
                        children: const [
                          Text(
                            'Entregar ahora',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Calle 1 # 2 - 3',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child:
                Image.asset('assets/images/splash.png', height: 90, width: 90),
          ),
        ],
      ),
    );
  }
}
