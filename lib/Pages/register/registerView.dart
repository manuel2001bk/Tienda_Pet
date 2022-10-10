import 'package:flutter/material.dart';
import 'package:tienda_pet_movil/Pages/LoginView/loginView.dart';

import '../../api/servicios.dart' as servicios;

class registerView extends StatefulWidget {
  registerView({Key? key}) : super(key: key);

  @override
  State<registerView> createState() => _registerViewState();
}

class _registerViewState extends State<registerView> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var checkbox = false;
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
        title: const Text('Registrate',
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
        builder: (BuildContext context, BoxConstraints viewP) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewP.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 35, top: 40, bottom: 40),
                      child: Row(
                        children: const [
                          Text('Crea una cuenta para empezar a usar la app',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 143, 143, 143))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 350,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text('Nombre',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          TextField(
                            controller: name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Nombre completo',
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
                      height: 100,
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Correo Electronico',
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
                      height: 100,
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
                            controller: password,
                            obscureText: _passwordVisible,
                            decoration: InputDecoration(
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
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                              'la contraseña debe contener caracteres, numeros y \nsimbolos con un minimo de 8 caracteres.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(175, 158, 158, 158))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: checkbox,
                            onChanged: (value) {
                              setState(() {
                                checkbox = value!;
                              });
                            },
                            shape: const StadiumBorder(),
                            activeColor: const Color.fromARGB(255, 72, 25, 124),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Al registrarme, acepto los ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                TextSpan(
                                  text: 'términos y \ncondiciones ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 231, 56, 99),
                                  ),
                                ),
                                TextSpan(
                                  text: 'y la ',
                                ),
                                TextSpan(
                                  text: "politicas de privacidad.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 231, 56, 99),
                                  ),
                                ),
                              ])),
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
                            if (checkbox &&
                                name.text.isNotEmpty &&
                                name.text.length > 3 &&
                                name.text.contains(RegExp(r'[a-zA-Z]')) &&
                                email.text.isNotEmpty &&
                                password.text.isNotEmpty &&
                                password.text.length >= 8 &&
                                password.text.contains(RegExp(
                                    r'[A-Z] [a-z] [0-9][!@#$%^&*(),.?":{}|<>]'))) {
                              var response = await servicios.singUp(
                                  name.text, email.text, password.text);
                              print(response);
                              if (response["code"] == true) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Registro correcto",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    content: const Text(
                                        "Verifique su correo para activar su cuenta"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    loginView())),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Error al registrarse",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    content: Text(response["message"]),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Error al registrarse",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  content: const Text(
                                      'Verifique que haya completado todos los campos'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text('Crear cuenta',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 65),
                      child: Row(
                        children: [
                          const Text('¿Ya tienes una cuenta?',
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
                                      builder: (context) => loginView()));
                            },
                            child: const Text('Iniciar sesion',
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
}
