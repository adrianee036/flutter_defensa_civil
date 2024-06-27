import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defensa_civil/Widgets/text_field.dart';
import 'package:flutter_defensa_civil/Widgets/user_data.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool exito;
  late String mensaje;

  Future<void> submitData() async {
    var url =
        Uri.parse('https://adamix.net/defensa_civil/def/iniciar_sesion.php');
    var response = await http.post(
      url,
      body: {
        'cedula': cedulaController.text,
        'clave': passwordController.text,
      },
    );
    var jsonResponse = jsonDecode(response.body);
    exito = jsonResponse['exito'];
    mensaje = jsonResponse['mensaje'];

    if (response.statusCode == 200) {
      var datos = jsonDecode(response.body)['datos'];
      //print(datos);
      //print(exito);
      if (exito) {
        UserData.nombre = datos['nombre'];
        UserData.apellido = datos['apellido'];
        UserData.correo = datos['correo'];
        UserData.telefono = datos['telefono'];
        UserData.token = datos['token'];
      }
    } else {
      print('Fallo con código de estado: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
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
              label: 'Contraseña',
              hintText: 'Ingrese su contraseña',
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
                      title: "Bienvenido ${UserData.nombre}",
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
    );
  }
}
