import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoticiasEspecificasView extends StatefulWidget {
  @override
  _NoticiasEspecificasViewState createState() => _NoticiasEspecificasViewState();
}

class _NoticiasEspecificasViewState extends State<NoticiasEspecificasView> {
  List<Map<String, dynamic>> noticias = [];

  Future<void> fetchNoticias() async {
    final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/noticias_especificas.php'));

    if (response.statusCode == 200) {
      setState(() {
        noticias = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load noticias');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias y Líneas de Acción Específicas'),
      ),
      body: Center(
        child: noticias.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(noticias[index]['titulo']),
                      subtitle: Text(noticias[index]['descripcion']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
