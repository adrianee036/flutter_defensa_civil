import 'package:flutter/material.dart';

class MiSituacion extends StatefulWidget {
  const MiSituacion({super.key});

  @override
  State<MiSituacion> createState() => _MiSituacionState();
}


class _MiSituacionState extends State<MiSituacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MiSituacion'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
