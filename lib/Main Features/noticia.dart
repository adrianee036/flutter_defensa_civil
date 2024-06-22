import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NoticiasPage extends StatefulWidget {
  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  late Future<Map<String, dynamic>> _futureNews;

  @override
  void initState() {
    super.initState();
    _futureNews = fetchNews();
  }

Future<Map<String, dynamic>> fetchNews() async {
  final url = 'https://adamix.net/defensa_civil/def/noticias.php';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load news');
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Noticias'),
    ),
    body: FutureBuilder<Map<String, dynamic>>(
      future: _futureNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error al cargar noticias'),
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic> newsMap = snapshot.data!;
          if (newsMap.containsKey('datos')) {
            List<dynamic> newsList = newsMap['datos'];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newsList[index]['titulo']),
                  subtitle: Text(newsList[index]['contenido']),
                  onTap: () {
                   
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('No se encontraron noticias'),
            );
          }
        } else {
          return Center(
            child: Text('No se encontraron noticias'),
          );
        }
      },
    ),
  );
}

}



