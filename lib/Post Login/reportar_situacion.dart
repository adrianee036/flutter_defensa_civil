import 'package:flutter/material.dart';

class Reportar extends StatefulWidget {
  const Reportar({super.key});

  @override
  State<Reportar> createState() => _ReportarState();
}


class _ReportarState extends State<Reportar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportar'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
