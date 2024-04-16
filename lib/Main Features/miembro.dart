import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Miembro {
  final String nombre;
  final String cargo;
  final String telefono;
  final String email;
  final String fotoUrl;

  Miembro(
      {required this.nombre,
      required this.cargo,
      required this.telefono,
      required this.email,
      required this.fotoUrl});

  factory Miembro.fromJson(Map<String, dynamic> json) {
    return Miembro(
      nombre: json['nombre'] ?? '',
      cargo: json['cargo'] ?? '',
      telefono: json['telefono'] ?? '',
      email: json['email'] ?? '',
      fotoUrl: json['foto_url'] ??
          '', // Asegurando que siempre haya un valor para la foto
    );
  }
}

class MiembrosView extends StatefulWidget {
  @override
  State<MiembrosView> createState() => _MiembrosDefensaCivilViewState();
}

class _MiembrosDefensaCivilViewState extends State<MiembrosView> {
  late Future<List<Miembro>> miembrosDefensaCivil;

  Future<List<Miembro>> fetchMiembrosDefensaCivil() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/miembros.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)[
          'datos']; // Acceso a los datos dentro del objeto de respuesta
      List<Miembro> miembros =
          data.map((json) => Miembro.fromJson(json)).toList();
      return miembros;
    } else {
      throw Exception('Fallo al cargar los miembros de la Defensa Civil');
    }
  }

  @override
  void initState() {
    super.initState();
    miembrosDefensaCivil = fetchMiembrosDefensaCivil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miembros de la Defensa Civil'),
      ),
      body: FutureBuilder<List<Miembro>>(
        future: miembrosDefensaCivil,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data![index].fotoUrl),
                  ),
                  title: Text(snapshot.data![index].nombre),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cargo: ${snapshot.data![index].cargo}'),
                      Text('Teléfono: ${snapshot.data![index].telefono}'),
                      Text('Email: ${snapshot.data![index].email}'),
                    ],
                  ),
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
