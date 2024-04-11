import 'package:flutter/material.dart';

class Noticia extends StatefulWidget {
  const Noticia({super.key});

  @override
  State<Noticia> createState() => _NoticiaState();
}


class _NoticiaState extends State<Noticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticia'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
