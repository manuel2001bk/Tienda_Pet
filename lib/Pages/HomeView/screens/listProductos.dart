import 'package:flutter/material.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/image_description.dart';
import 'package:firebase_database/firebase_database.dart';

class ListaProductos extends StatefulWidget {
  ListaProductos({Key? key}) : super(key: key);

  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(getProductos());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> itemsProducts = [
      "Alimento",
      "Accesorios",
      "Recompensas",
      "limpieza"
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Text(
                  "Productos cerca",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.35,
                height: 60,
                child: Padding(
                    padding: const EdgeInsets.only(top: 22, left: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          itemsProducts.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: index == count
                                            ? Colors.green
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        itemsProducts[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: index == count
                                                ? Colors.white
                                                : Colors.green),
                                      ),
                                    )),
                                  ),
                                ),
                              )),
                    )),
              )
            ],
          ),
          productsList(size),
        ],
      ),
    );
  }

  SizedBox productsList(Size size) {
    return SizedBox(
      height: 350,
      width: 400,
      child: FutureBuilder(
        future: getProductos(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SizedBox(
                      height: 300,
                      width: 225,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDescription(
                                  snapshot.data![index]["Imagen"],
                                  snapshot.data![index]["Descripcion"],
                                  snapshot.data![index]["Nombre"],
                                  snapshot.data![index]["Precio"],
                                  snapshot.data![index]["Precio_desc"],
                                  snapshot.data![index]["Stock"]),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              width: 225,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index]["Imagen"])),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data![index]["Nombre"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              snapshot.data![index]["Descripcion"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                // ignore: prefer_interpolation_to_compose_strings
                                text: '\$ ' + snapshot.data![index]["Precio"],
                                style: const TextStyle(
                                  color: Colors.pink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    text: ' \$ ' +
                                        snapshot.data![index]["Precio_desc"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              snapshot.data![index]["Stock"] + ' en stock',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List> getProductos() async {
    List listaItem = [];
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.reference().reference().child("Productos");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        for (final item in snapshot.value.entries) {
          print(item.value);
          listaItem.add(item.value);
        }
        return listaItem;
      }
    } catch (e) {
      return ["error"];
    }
    return ["vacío"];
  }
}
