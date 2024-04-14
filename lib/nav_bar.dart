import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Main Features/inicio.dart';
import 'package:flutter_defensa_civil/Main Features/albergues_screen.dart';
import 'package:flutter_defensa_civil/Main Features/historia.dart';
import 'package:flutter_defensa_civil/Main Features/mapa_alb_screen.dart';
import 'package:flutter_defensa_civil/Main Features/medicina_preventiva.dart';
import 'package:flutter_defensa_civil/Main Features/miembro.dart';
import 'package:flutter_defensa_civil/Main Features/noticia.dart';
import 'package:flutter_defensa_civil/Main Features/servicio.dart';
import 'package:flutter_defensa_civil/Main Features/video.dart';
import 'package:flutter_defensa_civil/Main Features/voluntario.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Usuario',
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
            accountEmail: Text(
              'usuarioFlutter@gmail.com',
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: 'https://i.ibb.co/DCXcp2h/user.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error_outline_rounded, size: 20,),
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(127, 0, 0, 1),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider('https://i.ibb.co/rHWfzX3/fondo2.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors
                        .black45, // Ajusta la opacidad para oscurecer más o menos
                    BlendMode
                        .darken, // El BlendMode puede ser darken, multiply, etc.
                  ),
                )),
          ),
          ListTile(
            leading: const Icon(Icons.notification_important_rounded),
            title: Text(
              'News',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inicio()),
              );
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home_max_rounded),
            title: Text(
              'Inicio',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inicio()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_edu_rounded),
            title: Text(
              'Historia',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historia()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_repair_service_rounded),
            title: Text(
              'Servicio',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Servicio()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: Text(
              'Noticia',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Noticia()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_collection_rounded),
            title: Text(
              'Video',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Video()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.house_siding_rounded),
            title: Text(
              'Albergue',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlberguesList()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.map_rounded),
            title: Text(
              'Mapa de Albergue',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapaConMarcadores()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_services_rounded),
            title: Text(
              'Medicina Preventiva',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Medicina()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_rounded),
            title: Text(
              'Miembro',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Miembro()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_rounded),
            title: Text(
              'Quiero Ser Voluntario',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Voluntario()),
              );
            },
          ),
        ],
      ),
    );
  }
}
