import 'package:flutter/material.dart';

class Albergue extends StatefulWidget {
  const Albergue({super.key});

  @override
  State<Albergue> createState() => _AlbergueState();
}


class _AlbergueState extends State<Albergue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albergue'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
