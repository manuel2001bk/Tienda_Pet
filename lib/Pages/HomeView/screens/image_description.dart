import 'package:flutter/material.dart';

class ImageDescription extends StatelessWidget {
  final String url, description, precio, descuento, nombre, stock;
  const ImageDescription(this.url, this.description, this.nombre, this.precio,
      this.descuento, this.stock,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tienda'),
          backgroundColor: const Color.fromARGB(255, 105, 46, 172),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: size.height * 0.03,
                  left: size.width * 0.07,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(child: Text("1")),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: size.height * 0.03,
                  left: size.width * 0.07,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(child: Text("1")),
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () async {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.manage_accounts,
                size: 30,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(fit: BoxFit.cover, image: NetworkImage(url)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                nombre,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: "\$ $precio",
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "        \$ $descuento antes",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$stock en stock",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
