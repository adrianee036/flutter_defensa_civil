import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  final List<Widget> carrusel = <Widget>[
    Tarjeta(
      image: Image.network('https://i.ibb.co/fXDp4J4/img6-inicio.jpg'),
      title: "Entrenamiento de reanimacion",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/qsBhttm/img1-inicio.jpg'),
      title: "Distribuyendo kits de alimentos.",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/pfpx0sm/img2-inicio.jpg'),
      title: "Distribuyendo kits de alimentos.",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/Lz1VgVm/img3-inicio.jpg'),
      title: "Limpiando comunidades",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/3yCcXk4/img4-inicio.jpg'),
      title: "Buscando un pais más limpio",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/ByXQ8hP/img5-inicio.jpg'),
      title: "Alerta de Huracan!",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/6RCS9VS/img7-inicio.jpg'),
      title: "Dando primeros auxlios",
    ),
    Tarjeta(
      image: Image.network('https://i.ibb.co/ZHsM5mV/img8-inicio.jpg'),
      title: "Rescatando personas de un desastre natural",
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
        //spaceBetweenItems: 300.0,
      ),
    );
  }
}


class Tarjeta extends StatelessWidget {
  const Tarjeta({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}