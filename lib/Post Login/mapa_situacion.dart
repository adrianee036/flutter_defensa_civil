import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Widgets/user_data.dart';
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MarkerData {
  final String titulo;
  final String descripcion;
  final String foto;
  final double lat;
  final double lng;

  MarkerData({
    required this.titulo,
    required this.descripcion,
    required this.foto,
    required this.lat,
    required this.lng,
  });
}

class MapaSituacion extends StatefulWidget {
  const MapaSituacion({super.key});

  @override
  State<MapaSituacion> createState() => _MapaSituacionState();
}

class _MapaSituacionState extends State<MapaSituacion> {
  late Future<List<MarkerData>> _futureMarkers;

  @override
  void initState() {
    super.initState();
    _futureMarkers = _fetchMarkers();
  }

  Future<List<MarkerData>> _fetchMarkers() async {
    var url = Uri.parse('https://adamix.net/defensa_civil/def/situaciones.php');
    print('la vaina ta jo jajajajaj' + UserData.token);
    final response = await http.post(
      url,
      body: {
        'token': UserData.token,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return parseMarkers(response.body);
    } else {
      throw Exception('Failed to load markers');
    }
  }

  List<MarkerData> parseMarkers(String responseBody) {
    final parsed = jsonDecode(responseBody);
    List<MarkerData> markers = [];
    if (parsed['exito'] == true) {
      for (var data in parsed['datos']) {
        markers.add(MarkerData(
          titulo: data['titulo'],
          descripcion: data['descripcion'],
          foto: data['foto'],
          lat: double.parse(data['latitud']),
          lng: double.parse(data['longitud']),
        ));
      }
    }
    return markers;
  }

  void mostrarInfo(BuildContext context, MarkerData markerData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalles'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Titulo: ${markerData.titulo}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Descripcion: ${markerData.descripcion}',
                  style: TextStyle(fontSize: 15)),
              SizedBox(
                height: 20,
              ),
              Image.network(
                markerData.foto,
                width: 200,
                height: 200,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa Situaciones'),
      ),
      body: FutureBuilder<List<MarkerData>>(
        future: _futureMarkers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Marker> markers = snapshot.data!
                .map((markerData) => Marker(
                      point: LatLng(markerData.lat, markerData.lng),
                      child: GestureDetector(
                        onTap: () => mostrarInfo(context,
                            markerData), // Mostrar información al hacer clic
                        child: Container(
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    ))
                .toList();

            return FlutterMap(
              options: MapOptions(
                center: LatLng(18.47893, -69.89178), // Centro del mapa inicial
                zoom: 12.0, // Nivel de zoom inicial
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                    markers: markers), // Agrega la capa de marcadores al mapa
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
