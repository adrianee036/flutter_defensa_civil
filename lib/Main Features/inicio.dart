import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<Widget> carrusel = <Widget>[
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/fXDp4J4/img6-inicio.jpg'),
      title: "Entrenamiento de reanimacion",
      mensaje: 'Mantén la calma y sigue las instrucciones de las autoridades.',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/qsBhttm/img1-inicio.jpg'),
      title: "Distribuyendo kits de alimentos.",
      mensaje: 'Si estás en una zona de riesgo, evacua de forma ordenada y sin pánico.',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/pfpx0sm/img2-inicio.jpg'),
      title: "Distribuyendo kits de alimentos.",
      mensaje: 'Prepárate para emergencias: alimentos, agua, medicinas y documentos',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/Lz1VgVm/img3-inicio.jpg'),
      title: "Limpiando comunidades",
      mensaje: 'Mantén tus dispositivos móviles cargados y usa la radio',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/3yCcXk4/img4-inicio.jpg'),
      title: "Buscando un pais más limpio",
      mensaje: 'Si ves una situación de riesgo, repórtala inmediatamente a las autoridades',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/ByXQ8hP/img5-inicio.jpg'),
      title: "Alerta de Huracan!",
      mensaje: 'Evita cruzar ríos crecidos o zonas inundadas. ',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/6RCS9VS/img7-inicio.jpg'),
      title: "Dando primeros auxlios",
      mensaje: 'Protege tu hogar: asegura techos, puertas y ventanas.',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/ZHsM5mV/img8-inicio.jpg'),
      title: "Rescatando personas de un desastre natural",
      mensaje: 'Si te encuentras en la carretera durante una tormenta, busca refugio',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: StackedCardCarousel(
        items: carrusel,
        spaceBetweenItems: 450.0,
      ),
    );
  }
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({
    super.key,
    required this.image,
    required this.title,
     required this.mensaje,
  });

  final dynamic image;
  final String title;
  final String mensaje;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 350,
              child: image,
            ),
            Text(
              title,
              style: GoogleFonts.oswald(),
            ),
            OutlinedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Estamos Cambiando',
                    message: mensaje,

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.warning,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  Icon(Icons.remove_red_eye_sharp),
                  Text('Mas')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
