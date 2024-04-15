import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MiembrosView extends StatefulWidget {
  @override
  _MiembrosViewState createState() => _MiembrosViewState();
}

class _MiembrosViewState extends State<MiembrosView> {
  List<Map<String, dynamic>> miembros = [];

  Future<void> fetchMiembros() async {
    final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/miembros.php'));

    if (response.statusCode == 200) {
      setState(() {
        miembros = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load miembros');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMiembros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miembros de la Defensa Civil Dominicana'),
      ),
      body: Center(
        child: miembros.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: miembros.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(miembros[index]['nombre']),
                    subtitle: Text(miembros[index]['cargo']),
                  );
                },
              ),
      ),
    );
  }
}
