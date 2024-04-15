import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MarkerData {
  final String ciudad;
  final String codigo;
  final String edificio;
  final String coordinador;
  final String telefono;
  final String capacidad;
  final double lat;
  final double lng;

  MarkerData({
    required this.ciudad,
    required this.codigo,
    required this.edificio,
    required this.coordinador,
    required this.telefono,
    required this.capacidad,
    required this.lat,
    required this.lng,
  });
}

class MapaConMarcadores extends StatefulWidget {
  @override
  _MapaConMarcadoresState createState() => _MapaConMarcadoresState();
}

class _MapaConMarcadoresState extends State<MapaConMarcadores> {
  late Future<List<MarkerData>> _futureMarkers;

  @override
  void initState() {
    super.initState();
    _futureMarkers = _fetchMarkers();
  }

  Future<List<MarkerData>> _fetchMarkers() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/albergues.php'));
    if (response.statusCode == 200) {
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
          ciudad: data['ciudad'],
          codigo: data['codigo'],
          edificio: data['edificio'],
          coordinador: data['coordinador'],
          telefono: data['telefono'],
          capacidad: data['capacidad'],
          lat: double.parse(data['lng']),
          lng: double.parse(data['lat']),
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
          title: Text(markerData.edificio),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ciudad: ${markerData.ciudad}'),
              Text('Código: ${markerData.codigo}'),
              Text('Coordinador: ${markerData.coordinador}'),
              Text('Teléfono: ${markerData.telefono}'),
              Text('Capacidad: ${markerData.capacidad}'),
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
        title: Text('Mapa Albergues'),
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
