import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart';

class Albergue {
  final String edificio;
  final String ciudad;
  final String telefono;
  final String capacidad;
  final String latitud;
  final String longitud;

  Albergue(
      {required this.edificio,
      required this.ciudad,
      required this.telefono,
      required this.capacidad,
      required this.latitud,
      required this.longitud});

  factory Albergue.fromJson(Map<String, dynamic> json) {
    return Albergue(
        edificio: json['edificio'],
        ciudad: json['ciudad'],
        telefono: json['telefono'],
        capacidad: json['capacidad'],
        latitud: json['lng'],
        longitud: json['lat']);
  }
}

class AlberguesList extends StatefulWidget {
  @override
  State<AlberguesList> createState() => _AlberguesListState();
}

class _AlberguesListState extends State<AlberguesList> {
  late Future<List<Albergue>> albergueList;
  List _foundAlbergues = [];
  Future<List<Albergue>> fetchAlbergues() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/albergues.php'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> albergues = data['datos'];
      List<Albergue> albergueList =
          albergues.map((json) => Albergue.fromJson(json)).toList();
      return albergueList;
    } else {
      throw Exception('Fallo');
    }
  }

  muestralo() async {
    albergueList = fetchAlbergues();
    _foundAlbergues = await albergueList;
    return _foundAlbergues;
  }

  @override
  void initState() {
    muestralo();
    super.initState();
  }

  void _runFilter(String enteredKeyword) async {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = await albergueList;
    } else {
      List resultss = await albergueList;

      results = resultss
          .where((albergue) => albergue.edificio
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundAlbergues = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            margin: const EdgeInsets.all(10.0),
            height: 35,
            child: Text(
              'Albergues',
              style: TextStyle(
                fontSize: 25,
              ),
            )),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
                labelText: 'Buscar',
                suffixIcon: Icon(Icons.search),
                hintText: '"Nombre de Albergue"'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder<List<Albergue>>(
            future: fetchAlbergues(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: _foundAlbergues.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        double latitud =
                            double.tryParse(_foundAlbergues[index].latitud) ??
                                0;
                        double longitud =
                            double.tryParse(_foundAlbergues[index].longitud) ??
                                0;
                        Future<String> mostrarDireccion() async {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(latitud, longitud);
                          return '${placemarks.first.street}';
                        }

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Detalles'),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Albergue: ${_foundAlbergues[index].edificio}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  FutureBuilder<String>(
                                    future: mostrarDireccion(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text('Calle: ${snapshot.data}',
                                            style: TextStyle(fontSize: 15));
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Ciudad: ${_foundAlbergues[index].ciudad}',
                                      style: TextStyle(fontSize: 15)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Telefono: ${_foundAlbergues[index].telefono}',
                                      style: TextStyle(fontSize: 15)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Capacidad: ${_foundAlbergues[index].capacidad}',
                                      style: TextStyle(fontSize: 15)),
                                ]),
                          ),
                        );
                      },
                      child: ListTile(
                          title: Text(_foundAlbergues[index].edificio),
                          subtitle: Text(_foundAlbergues[index].ciudad),
                          trailing: Icon(
                            Icons.arrow_right,
                            size: 40,
                          )),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        )
      ],
    ));
  }
}
