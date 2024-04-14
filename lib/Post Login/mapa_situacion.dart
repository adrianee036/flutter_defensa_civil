import 'package:flutter/material.dart';

class MapaSituacion extends StatefulWidget {
  const MapaSituacion({super.key});

  @override
  State<MapaSituacion> createState() => _MapaSituacionState();
}


class _MapaSituacionState extends State<MapaSituacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapaSituacion'),
      ),
      body: Center(
        child: Text('Contenido de MiWidget'),
      ),
    );
  }
}
