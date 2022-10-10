import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tienda_pet_movil/Pages/HomeView/homeView.dart';
import 'package:tienda_pet_movil/Pages/LoginView/loginView.dart';
import 'package:tienda_pet_movil/Pages/register/registerView.dart';

import '../../API/Auth.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => MenuViewState();
}

class MenuViewState extends State<MenuView> {
  final Auth _Auth = Auth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.only(top: 50),
              width: 150,
              child: Image.asset('assets/images/splash.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () async {
                  UserCredential userGoogle = await _Auth.loginWithGoogle();
                  if (userGoogle.user != null) {
                    print(userGoogle.user!.displayName);
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  } else {
                    print("Error al iniciar sesión con Google");
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 48),
                    primary: const Color(0xff3169f5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    FaIcon(FontAwesomeIcons.google, color: Colors.white),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(
                      'Continuar con Google',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  await _Auth.loginWithFacebook();
                  if (_Auth.user != null) {
                    print(_Auth.user!.user!.displayName);
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  } else {
                    print("Error al iniciar sesión con Facebook");
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 48),
                    primary: const Color(0xff324fa5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    FaIcon(
                      FontAwesomeIcons.squareFacebook,
                      size: 30,
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(
                      'Continuar con Facebook',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registerView()))
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xff64686f),
                  ),
                  minimumSize: const Size(300, 48),
                  primary: const Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Icon(
                      Icons.mail_rounded,
                      color: Color(0xff64686f),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(
                      'Registrarse con e-mail',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff64686f)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Entrar como invitado',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffc1460)),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Entrar como vendedor',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff76a757)),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Ya tienes cuenta?',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginView()));
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffc1460)),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
