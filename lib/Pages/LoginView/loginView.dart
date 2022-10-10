import 'package:flutter/material.dart';
import 'package:tienda_pet_movil/Pages/HomeView/homeView.dart';
import 'package:tienda_pet_movil/Pages/recuperarPasswordCorreo/recuperarPasswordCorreoView.dart';
import 'package:tienda_pet_movil/Pages/register/registerView.dart';

import '../../models/user.dart';

import '../../api/servicios.dart' as servicios;

class loginView extends StatefulWidget {
  loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool validEmail = false;
  bool statusPassword = false;
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 25, 124),
        title: const Text('Iniciar Sesión',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
                Image.asset('assets/images/splash.png', height: 40, width: 40),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, top: 40, bottom: 40),
                      child: Row(
                        children: const [
                          Text('Inicia sesión con tu cuenta para continuar',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 143, 143, 143))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: 350,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text('Correo Electronico',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          TextField(
                            controller: email,
                            onChanged: (v) {
                              validarEmail(v);
                            },
                            decoration: InputDecoration(
                              counterText: !validEmail ? "" : "Correo Invalido",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Email Address',
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 143, 143, 143),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: 350,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text('Contraseña',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          TextField(
                            onChanged: (value) {
                              validPassword(value);
                            },
                            obscureText: !_passwordVisible,
                            controller: password,
                            decoration: InputDecoration(
                              counterText: statusPassword
                                  ? "8 caracteres, con una mayúscula, numero y un carácter especial"
                                  : "",
                              counterStyle: TextStyle(
                                  color: statusPassword
                                      ? Colors.red
                                      : Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 143, 143, 143),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: _passwordVisible
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          recuperarPasswordCorreoView()));
                            },
                            child: const Text('¿Has olvidado tu contraseña?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 231, 56, 99),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 50,
                        width: 350,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                          ),
                          onPressed: () async {
                            var response = await servicios.signIn(
                                email.text, password.text);
                            print(response);
                            if (response["code"] == true) {
                              final usuario = Users.instance;
                              usuario.idUser = response["basicUser"]["idUser"];
                              usuario.token = response["token"];
                              print(usuario.idUser);

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text(response["message"],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  content: const Text(
                                      'CORRECTO: El usuario ha iniciado sesión correctamente'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    recuperarPasswordCorreoView()))
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title:
                                      const Text('Error al realizar el login'),
                                  content: const Text(
                                      'Verifica tus datos de ingreso.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => {
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeView()))
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text('Ingresar',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 65),
                      child: Row(
                        children: [
                          const Text('¿Todavia no tienes una cuenta?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registerView()));
                            },
                            child: const Text('Regístrate',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 231, 56, 99),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  validarEmail(v) {
    print("entro");
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v)) {
      validEmail = false;
      setState(() {});
    } else {
      validEmail = true;
      setState(() {});
    }
  }

  validPassword(String value) {
    if (value.length < 8) {
      statusPassword = true;
      setState(() {});
    } else {
      if (value.contains(RegExp(r"[a-z]")) &&
          value.contains(RegExp(r"[0-9]")) &&
          value.contains(RegExp(r"[@]|[#]|[$]|[%]|[%]|[&]"))) {
        statusPassword = false;
        setState(() {});
      }
    }
  }
}
