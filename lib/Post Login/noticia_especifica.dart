import 'package:flutter/material.dart';

class NoticiaSpecifica extends StatefulWidget {
  const NoticiaSpecifica({super.key});

  @override
  State<NoticiaSpecifica> createState() => _NoticiaSpecificaState();
}


class _NoticiaSpecificaState extends State<NoticiaSpecifica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoticiaSpecifica'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
