import 'package:flutter/material.dart';
import 'package:tienda_pet_movil/API/Auth.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/bannerMascotas.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/bannerNombre.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/barraBusqueda.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/listProductos.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/listServicios.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/slider_widget.dart';
import 'package:tienda_pet_movil/Pages/HomeView/screens/tarjetaSeciones.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Auth _Auth = Auth.instance;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final List<Widget> _pages = <Widget>[
      ListView(
        children: [
          BannerNombre(),
          BannerMascota(),
          TajetasProductosServicios(),
          BarraBusqueda(),
          Carousel(),
          ListaProductos(),
          ListaServicios(),
        ],
      ),
      Container(
        alignment: Alignment.center,
        child: const Text('Calendario Proximamente'),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text('Ubicaciones Proximamente'),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text('Adopcion Proximamente'),
      ),
    ];

    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
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
                await _Auth.signOut();
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
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.room,
                  color: Colors.white,
                  size: 30,
                ),
                label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
