import 'package:flutter/material.dart';

class Servicio extends StatefulWidget {
  const Servicio({super.key});

  @override
  State<Servicio> createState() => _ServicioState();
}


class _ServicioState extends State<Servicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicio'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
