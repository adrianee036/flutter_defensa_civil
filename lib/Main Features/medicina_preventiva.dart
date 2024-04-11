import 'package:flutter/material.dart';

class Medicina extends StatefulWidget {
  const Medicina({super.key});

  @override
  State<Medicina> createState() => _MedicinaState();
}


class _MedicinaState extends State<Medicina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicina'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
