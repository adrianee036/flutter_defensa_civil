import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class Servicio extends StatefulWidget {
  const Servicio({super.key});

  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  dynamic datos;

  @override
  void initState() {
    super.initState();
    getServicio();

    setState(() {});
  }

  Future<void> getServicio() async {
    //https://adamix.net/defensa_civil/def/servicios.php
    Uri url = Uri.parse('https://adamix.net/defensa_civil/def/servicios.php');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        datos = jsonDecode(response.body)['datos'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio'),
      ),
      body: ListView.builder(
        itemCount: datos == null ? 0 : datos.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: datos[index]['foto'],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(height: 8),
                  Text(
                    datos[index]['nombre'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(datos[index]['descripcion']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
