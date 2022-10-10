import 'package:flutter/material.dart';

class BannerMascota extends StatefulWidget {
  BannerMascota({Key? key}) : super(key: key);

  @override
  State<BannerMascota> createState() => _BannerMascotaState();
}

class _BannerMascotaState extends State<BannerMascota> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        width: 400,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                    child: Text(
                      'Mis mascotas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(242, 242, 242, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 105, 46, 172),
                                  width: 2),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            size: 40,
                            color: Color.fromARGB(255, 105, 46, 172),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Agregar \nmascota',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 105, 46, 172)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
