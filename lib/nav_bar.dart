import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Main Features/inicio.dart';
import 'package:flutter_defensa_civil/Main Features/albergue.dart';
import 'package:flutter_defensa_civil/Main Features/historia.dart';
import 'package:flutter_defensa_civil/Main Features/mapa_albergue.dart';
import 'package:flutter_defensa_civil/Main Features/medicina_preventiva.dart';
import 'package:flutter_defensa_civil/Main Features/miembro.dart';
import 'package:flutter_defensa_civil/Main Features/noticia.dart';
import 'package:flutter_defensa_civil/Main Features/servicio.dart';
import 'package:flutter_defensa_civil/Main Features/video.dart';
import 'package:flutter_defensa_civil/Main Features/voluntario.dart';
import 'package:google_fonts/google_fonts.dart';

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
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            accountEmail: Text(
              'usuarioFlutter@gmail.com',
              style: GoogleFonts.oswald(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://i.ibb.co/DCXcp2h/user.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://i.ibb.co/rHWfzX3/fondo2.jpg'),
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
            title: const Text('News'),
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
            title: const Text('Inicio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inicio()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_edu_rounded),
            title: const Text('Historia'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historia()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_repair_service_rounded),
            title: const Text('Servicio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Servicio()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text('Noticia'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Noticia()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_collection_rounded),
            title: const Text('Video'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Video()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.house_siding_rounded),
            title: const Text('Albergue'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Albergue()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.maps_home_work_rounded),
            title: const Text('Mapa de Albergue'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mapa()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_services_rounded),
            title: const Text('Medicina Preventiva'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Medicina()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_rounded),
            title: const Text('Miembro'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Miembro()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_rounded),
            title: const Text('Quiero Ser Voluntario'),
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
