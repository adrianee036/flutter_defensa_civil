import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Miembro {
  final String nombre;
  final String cargo;

  Miembro({required this.nombre, required this.cargo});

  factory Miembro.fromJson(Map<String, dynamic> json) {
    return Miembro(
      nombre: json['nombre'],
      cargo: json['cargo'],
    );
  }
}

class MiembrosList extends StatefulWidget {
  @override
  State<MiembrosList> createState() => _MiembrosListState();
}

class _MiembrosListState extends State<MiembrosList> {
  late Future<List<Miembro>> miembrosList;

  Future<List<Miembro>> fetchMiembros() async {
    final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/miembros.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Miembro> miembrosList =
          data.map((json) => Miembro.fromJson(json)).toList();
      return miembrosList;
    } else {
      throw Exception('Failed to load miembros');
    }
  }

  @override
  void initState() {
    super.initState();
    miembrosList = fetchMiembros();
  }

  void _runFilter(String enteredKeyword) {
    // Implementa la lógica de filtrado si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miembros de la Defensa Civil Dominicana'),
      ),
      body: Column(
        children: [
          // Puedes agregar un campo de búsqueda si lo deseas
          // Este ejemplo muestra una lista sin opción de búsqueda
          Expanded(
            child: FutureBuilder<List<Miembro>>(
              future: miembrosList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Aquí puedes agregar la lógica para mostrar detalles del miembro si es necesario
                        },
                        child: ListTile(
                          title: Text(snapshot.data![index].nombre),
                          subtitle: Text(snapshot.data![index].cargo),
                          // Puedes personalizar la apariencia de cada elemento de la lista aquí
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

