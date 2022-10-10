import 'package:flutter/material.dart';

import '../../api/servicios.dart' as servicios;

class recuperarPasswordCorreoView extends StatefulWidget {
  const recuperarPasswordCorreoView({Key? key}) : super(key: key);

  @override
  State<recuperarPasswordCorreoView> createState() =>
      _recuperarPasswordCorreoViewState();
}

class _recuperarPasswordCorreoViewState
    extends State<recuperarPasswordCorreoView> {
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 25, 124),
        title: const Text('Recuperar contraseña',
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
                          const EdgeInsets.only(left: 15, top: 40, bottom: 40),
                      child: Row(
                        children: const [
                          Text('Ingresa tu email para recuperar la contraseña',
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
                              labelText: 'Direccion de correo',
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 143, 143, 143),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                          'Ingrese su correo electronico registrado y le enviaremos un\ncorreo electronico que contiene un enlace para restablecer\nsu contraseña',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(150, 0, 0, 0))),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
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
                              if (email.text.isNotEmpty) {
                                var response =
                                    await servicios.recoverPassword(email.text);
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
                                          "Se ha enviado un enlace de recuperacion a su correo"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
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
                                      title: const Text("Error",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      content: const Text(
                                          "Verifique que su correo sea el correcto"),
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
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Error",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    content: const Text(
                                        "Debe completar los campos para continuar"),
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
                            child: const Text('Enviar solicitud',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
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
