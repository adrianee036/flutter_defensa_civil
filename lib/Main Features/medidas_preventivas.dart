import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedidaPreventiva {
  final String medida;

  MedidaPreventiva({required this.medida});

  factory MedidaPreventiva.fromJson(Map<String, dynamic> json) {
    return MedidaPreventiva(
      medida: json['medida'],
    );
  }
}

class MedidasPreventivasList extends StatefulWidget {
  @override
  State<MedidasPreventivasList> createState() => _MedidasPreventivasListState();
}

class _MedidasPreventivasListState extends State<MedidasPreventivasList> {
  late Future<List<MedidaPreventiva>> medidasPreventivasList;

Future<List<MedidaPreventiva>> fetchMedidasPreventivas() async {
  final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/medidas_preventivas.php'));

  if (response.statusCode == 200) {
    dynamic data = jsonDecode(response.body);
    print('Datos recibidos: $data');
    if (data != null) {
      if (data is List) {
        List<MedidaPreventiva> medidasPreventivasList = data.map((json) => MedidaPreventiva.fromJson(json)).toList();
        return medidasPreventivasList;
      } else if (data is Map<String, dynamic>) {
        MedidaPreventiva medidaPreventiva = MedidaPreventiva.fromJson(data);
        return [medidaPreventiva];
      }
    }
    print('Datos recibidos son nulos o no válidos');
    return [];
  } else {
    print('Fallo en la solicitud HTTP: ${response.statusCode}');
    throw Exception('Fallo en la solicitud HTTP: ${response.statusCode}');
  }
}


  @override
  void initState() {
    super.initState();
    medidasPreventivasList = fetchMedidasPreventivas();
  }

  void _runFilter(String enteredKeyword) {
    // Implementa la lógica de filtrado si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas Preventivas'),
      ),
      body: Column(
        children: [
          // Puedes agregar un campo de búsqueda si lo deseas
          // Este ejemplo muestra una lista sin opción de búsqueda
          Expanded(
            child: FutureBuilder<List<MedidaPreventiva>>(
              future: medidasPreventivasList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Aquí puedes agregar la lógica para mostrar detalles de la medida preventiva si es necesario
                        },
                        child: ListTile(
                          title: Text(snapshot.data![index].medida),
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

