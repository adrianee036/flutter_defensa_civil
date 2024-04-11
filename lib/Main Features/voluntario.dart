import 'package:flutter/material.dart';

class Voluntario extends StatefulWidget {
  const Voluntario({super.key});

  @override
  State<Voluntario> createState() => _VoluntarioState();
}


class _VoluntarioState extends State<Voluntario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voluntario'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
