import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defensa_civil/Widgets/text_field.dart';
import 'package:http/http.dart' as http;

class Voluntario extends StatefulWidget {
  const Voluntario({super.key});

  @override
  State<Voluntario> createState() => _VoluntarioState();
}

class _VoluntarioState extends State<Voluntario> {
  String nombre = '';
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  late bool exito;
  late String mensaje;

  Future<void> submitData() async {
    var url = Uri.parse('https://adamix.net/defensa_civil/def/registro.php');
    var response = await http.post(
      url,
      body: {
        'cedula': cedulaController.text,
        'nombre': nombreController.text,
        'apellido': apellidoController.text,
        'clave': passwordController.text,
        'correo': correoController.text,
        'telefono': telefonoController.text,
      },
    );
    var jsonResponse = jsonDecode(response.body);
    exito = jsonResponse['exito'];
    mensaje = jsonResponse['mensaje'];

    if (response.statusCode == 200) {
      if (exito) {}
    } else {
      print('Fallo con código de estado: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                height: 80,
                child: Icon(
                  Icons.security_rounded,
                  size: 80,
                ),
              ),
              TextFieldWidget(
                numerico: [FilteringTextInputFormatter.digitsOnly],
                label: 'Cedula',
                hintText: 'Ingrese su cedula',
                icon: Icons.rectangle_rounded,
                controller: cedulaController,
                keyboardType: TextInputType.number,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Nombre',
                hintText: 'Ingrese su nombre',
                icon: Icons.abc,
                controller: nombreController,
                keyboardType: TextInputType.text,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Apellido',
                hintText: 'Ingrese su apellido',
                icon: Icons.abc,
                controller: apellidoController,
                keyboardType: TextInputType.text,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [FilteringTextInputFormatter.digitsOnly],
                label: 'Telefono',
                hintText: 'Ingrese su telefono',
                icon: Icons.numbers,
                controller: telefonoController,
                keyboardType: TextInputType.number,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Correo',
                hintText: 'Ingrese su correo',
                icon: Icons.abc,
                controller: correoController,
                keyboardType: TextInputType.text,
                pass: false,
              ),
              TextFieldWidget(
                numerico: [],
                label: 'Contraseña',
                hintText: 'Ingrese la contraseña',
                icon: Icons.password_rounded,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                pass: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await submitData();

                  SnackBar snackBar;
                  if (exito) {
                    snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: "Usuario registrado correctamente!",
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
        ),
      ),
    );
  }
}
