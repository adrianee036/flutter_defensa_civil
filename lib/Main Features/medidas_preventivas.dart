import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedidaPreventiva {
  final String titulo;
  final String descripcion;

  MedidaPreventiva({required this.titulo, required this.descripcion});

  factory MedidaPreventiva.fromJson(Map<String, dynamic> json) {
    return MedidaPreventiva(
      titulo: json['titulo'],
      descripcion: json['descripcion'],
    );
  }
}

class MedidasPreventivasView extends StatefulWidget {
  @override
  State<MedidasPreventivasView> createState() => _MedidasPreventivasViewState();
}

class _MedidasPreventivasViewState extends State<MedidasPreventivasView> {
  late Future<List<MedidaPreventiva>> medidasPreventivas;

  Future<List<MedidaPreventiva>> fetchMedidasPreventivas() async {
    final response = await http.get(Uri.parse(
        'https://adamix.net/defensa_civil/def/medidas_preventivas.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)[
          'datos']; // Acceso a los datos dentro del objeto de respuesta
      List<MedidaPreventiva> medidas =
          data.map((json) => MedidaPreventiva.fromJson(json)).toList();
      return medidas;
    } else {
      throw Exception('Fallo al cargar las medidas preventivas');
    }
  }

  @override
  void initState() {
    super.initState();
    medidasPreventivas = fetchMedidasPreventivas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas Preventivas'),
      ),
      body: FutureBuilder<List<MedidaPreventiva>>(
        future: medidasPreventivas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].titulo),
                  subtitle: Text(snapshot.data![index].descripcion),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

