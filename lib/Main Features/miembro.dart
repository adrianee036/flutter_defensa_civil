import 'package:flutter/material.dart';

class Miembro extends StatefulWidget {
  const Miembro({super.key});

  @override
  State<Miembro> createState() => _MiembroState();
}


class _MiembroState extends State<Miembro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miembro'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
