import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedidasPreventivasView extends StatefulWidget {
  @override
  _MedidasPreventivasViewState createState() => _MedidasPreventivasViewState();
}

class _MedidasPreventivasViewState extends State<MedidasPreventivasView> {
  List<String> medidasPreventivas = [];

  Future<void> fetchMedidasPreventivas() async {
    final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/medidas_preventivas.php'));

    if (response.statusCode == 200) {
      setState(() {
        medidasPreventivas = List<String>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load medidas preventivas');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMedidasPreventivas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas Preventivas'),
      ),
      body: Center(
        child: medidasPreventivas.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: medidasPreventivas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medidasPreventivas[index]),
                  );
                },
              ),
      ),
    );
  }
}
