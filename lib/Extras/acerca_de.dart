import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({super.key});

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
 final List<Widget> carrusel = <Widget>[
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/jRPzTVF/person1.png'),
      nombre: "Jose Rosario Ureña",
      matricula: '2019-7807',
      github: 'https://github.com/JROSARIO-DEV',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/hcxJzNJ/person3.png'),
      nombre: "ADRIAN ELIAS UREÑA GOMEZ",
      matricula: '2021-2225',
      github: 'https://github.com/adrianee036',
    ),
    Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/hDq0KMM/person2.png'),
      nombre: "HARVEY FERRERAS VARELA",
      matricula: '2019-7792',
      github: 'https://github.com/h-ferreras',
    ),
        Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/8xFrJVz/person5.png'),
      nombre: "FELIX ALEJANDRO CAMILO JAVIER",
      matricula: '2021-1016',
      github: 'https://github.com/alejandrocamilo',
    ),
        Tarjeta(
      image: CachedNetworkImage(
          imageUrl: 'https://i.ibb.co/P95MNjP/person4.png'),
      nombre: "Eliam Pilier",
      matricula: '1111-5555',
      github: 'https://github.com/EliamPilier',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
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
    required this.nombre,
    required this.matricula,
    required this.github,

  });

  final dynamic image;
  final String nombre;
  final String matricula;
  final String github;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 300,
              child: image,
            ),
            const SizedBox(height: 5,),
            Text(nombre,style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5,),
            Text("Matricula: $matricula",style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 5,),
            Text("GirHub: $github",style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}