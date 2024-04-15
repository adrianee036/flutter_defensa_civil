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
import 'package:flutter_defensa_civil/Main Features/Medidas_Preventivas.dart';

import 'package:flutter_defensa_civil/Post%20Login/mapa_situacion.dart';
import 'package:flutter_defensa_civil/Post%20Login/mi_situacion.dart';
import 'package:flutter_defensa_civil/Post%20Login/noticia_especifica.dart';
import 'package:flutter_defensa_civil/Post%20Login/reportar_situacion.dart';
import 'package:flutter_defensa_civil/Widgets/user_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}


class _NavBarState extends State<NavBar> {
  var esVisible = UserData.nombre.isNotEmpty ;

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
                    _buildListTile(
              Icons.more_horiz_outlined,
              'Noticia especifica',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticiaSpecifica())),
              esVisible),
          _buildListTile(
              Icons.more_horiz_outlined,
              'Reportar',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Reportar())),
              esVisible),
          _buildListTile(
              Icons.more_horiz_outlined,
              'Mis situaciones',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MiSituacion())),
              esVisible),
          _buildListTile(
              Icons.more_horiz_outlined,
              'Mapa de Situacion',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapaSituacion())),
              esVisible),
          const Divider(),
          _buildListTile(
              Icons.home_max_rounded,
              'Inicio',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Inicio())),
              true),
          _buildListTile(
              Icons.history_edu_rounded,
              'Historia',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoriaPage())),
              true),
          _buildListTile(
              Icons.home_repair_service_rounded,
              'Servicio',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Servicio())),
              true),
          _buildListTile(
              Icons.newspaper_rounded,
              'Noticias',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticiasPage())),
              true),
          _buildListTile(
              Icons.video_collection_rounded,
              'Video',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Video())),
              true),
          _buildListTile(
              Icons.house_siding_rounded,
              'Albergue',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlberguesList())),
              true),
          _buildListTile(
              Icons.map_rounded,
              'Mapa de Albergue',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapaConMarcadores())),
              true),
          _buildListTile(
              Icons.medical_services_rounded,
              'Medicina Preventiva',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Medicina())),
              true),
          _buildListTile(
              Icons.person_add_rounded,
              'Miembro',
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Miembro())),
              true),
          _buildListTile(
              Icons.people_alt_rounded,
              'Quiero Ser Voluntario',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Voluntario())),
              true),
                    _buildListTile(
              Icons.people_alt_rounded,
              'Quiero Ser Voluntario',
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MedidasPreventivas())),
              true),
          

        ],
      ),
    );
  }

  Widget _buildListTile(
      IconData icon, String title, VoidCallback onTap, bool visible) {
    return Visibility(
      visible: visible,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: GoogleFonts.oswald(),
        ),
        onTap: onTap,
      ),
    );
    
  }
}
