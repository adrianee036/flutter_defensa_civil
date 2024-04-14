import 'package:flutter/material.dart';

class HistoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historia de la Defensa Civil en República Dominicana'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'La historia de la Defensa Civil en la República Dominicana se remonta a antes de 1966, cuando un grupo de radioaficionados se reunía en la Cruz Roja para colaborar durante la temporada de huracanes y otras emergencias.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'El Dr. Rafael Cantizano Arias fue designado presidente de la Cruz Roja y al mismo tiempo nombraron al Ing. Carlos D´ Franco como director de la Defensa Civil. Su primera oficina se ubicó en la calle Francia esquina Galván.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'La Defensa Civil fue creada oficialmente el 17 de junio de 1966 mediante la Ley 257, dependiendo inicialmente de la Secretaría Administrativa de la Presidencia. En la actualidad, es presidida por la Comisión Nacional de Emergencias.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'A lo largo de los años, la Defensa Civil ha tenido varios directores, incluyendo a:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '- Ing. Carlos D´ Franco (17-07-1966 - 11-06-1971)\n'
                '- Dr. Mariano Ariza Hernández (11-06-1971 - 26-08-1974)\n'
                '- Dr. Pedro Justiniano Polanco (26-08-1974 - 15-01-1982)\n'
                '- Dr. Domingo Porfirio Rojas (15-01-1982 - 16-01-1985)\n'
                '- Lic. Alfonso Julia Mera (16-01-1985 - 28-08-1986)\n'
                '- Dr. Eugenio Cabral Martínez (28-08-1986 - 01-09-1998)\n'
                '- Lic. Manuel Elpidio Báez (01-09-1998 - 27-02-1999)\n'
                '- José Antonio De los Santos (27-02-1999 - 17-08-2000)\n'
                '- Radhames Lora Salcedo (17-08-2000 - 01-09-2004)\n'
                '- Lic. Luis Antonio Luna Paulino (01-09-2004 - 10-10-2014)\n'
                '- Rafael Emilio De Luna Pichirilo (10-10-2014 - 01-02-2017)\n'
                '- Rafael Antonio Carrasco Paulino (01-02-2017 - 05-05-2021)\n'
                '- Lic. Juan Cesario Salas Rosario (05-05-2021 - Director actual)\n',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

