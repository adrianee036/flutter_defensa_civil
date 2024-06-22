import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Widgets/text_field.dart';
import 'package:flutter_defensa_civil/Widgets/user_data.dart';
import 'package:http/http.dart' as http;

class Contrasena extends StatefulWidget {
  const Contrasena({super.key});

  @override
  State<Contrasena> createState() => _ContrasenaState();
}

class _ContrasenaState extends State<Contrasena> {
  final TextEditingController passOldController = TextEditingController();
  final TextEditingController passNewController = TextEditingController();
  late bool exito;
  late String mensaje;

  Future<void> submitData() async {
    var url =
        Uri.parse('https://adamix.net/defensa_civil/def/cambiar_clave.php');
    var response = await http.post(
      url,
      body: {
        'token': UserData.token,
        'clave_anterior': passOldController.text,
        'clave_nueva': passNewController.text,
      },
    );
    var jsonResponse = jsonDecode(response.body);
    exito = jsonResponse['exito'];
    mensaje = jsonResponse['mensaje'];
    //print(UserData.token);
    //print('hola');

    if (response.statusCode == 200) {
      print('exito ${response.statusCode}');
    } else {
      print('Fallo con código de estado: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cambiar Contraseña'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                height: 80,
                child: Icon(
                  Icons.lock_reset_rounded,
                  size: 80,
                ),
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Contraseña Anterior',
                hintText: 'Ingrese su Contraseña Anterior',
                icon: Icons.lock_outline,
                controller: passOldController,
                keyboardType: TextInputType.number,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Contraseña Nueva',
                hintText: 'Ingrese su Contraseña Nueva',
                icon: Icons.lock_outline_rounded,
                controller: passNewController,
                keyboardType: TextInputType.visiblePassword,
                pass: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await submitData();
                  setState(() {});
                  SnackBar snackBar;
                  if (exito) {
                    snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: "Contraseña Cambiada",
                        message: '',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.success,
                      ),
                    );
                  } else {
                    snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: "Error",
                        message: '$mensaje',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                      ),
                    );
                  }
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
