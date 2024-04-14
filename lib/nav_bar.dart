import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Extras/iniciar_seccion.dart';
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
import 'package:flutter_defensa_civil/Post%20Login/mapa_situacion.dart';
import 'package:flutter_defensa_civil/Post%20Login/mi_situacion.dart';
import 'package:flutter_defensa_civil/Post%20Login/noticia_especifica.dart';
import 'package:flutter_defensa_civil/Post%20Login/reportar_situacion.dart';
import 'package:flutter_defensa_civil/Widgets/user_data.dart';
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
              "${UserData.nombre} ${UserData.apellido}",
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
            accountEmail: Text(
              UserData.correo,
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
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline_rounded,
                    size: 20,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(127, 0, 0, 1),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      'https://i.ibb.co/rHWfzX3/fondo2.jpg'),
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
                MaterialPageRoute(builder: (context) => HistoriaPage()),
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
              'Noticias',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiasPage()),
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
                              ListTile(
            leading: const Icon(Icons.login_rounded),
            title: Text(
              'Iniciar Seccion',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
                    ListTile(
            leading: const Icon(Icons.more_horiz_outlined),
            title: Text(
              'Noticia especifica',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiaSpecifica()),
              );
            },
          ),
                    ListTile(
            leading: const Icon(Icons.more_horiz_outlined),
            title: Text(
              'Reportar',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reportar()),
              );
            },
          ),
                    ListTile(
            leading: const Icon(Icons.more_horiz_outlined),
            title: Text(
              'Mis situaciones',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MiSituacion()),
              );
            },
          ),
                    ListTile(
            leading: const Icon(Icons.more_horiz_outlined),
            title: Text(
              'Mapa de Situacion',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapaSituacion()),
              );
            },
          ),
                    ListTile(
            leading: const Icon(Icons.more_horiz_outlined),
            title: Text(
              'cambiar contrasena',
              style: GoogleFonts.oswald(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
