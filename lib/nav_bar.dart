import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Usuario'),
            accountEmail: Text('usuarioFlutter@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  '',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('')
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.notification_important_rounded),
            title: Text('News'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
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
            leading: Icon(Icons.home_max_rounded),
            title: Text('Inicio'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.history_edu_rounded),
            title: Text('Historia'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.home_repair_service_rounded),
            title: Text('Servicio'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.newspaper_rounded),
            title: Text('Noticia'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.video_collection_rounded),
            title: Text('Video'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.house_siding_rounded),
            title: Text('Albergue'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.maps_home_work_rounded),
            title: Text('Mapa de Albergue'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.medical_services_rounded),
            title: Text('Medicina Preventiva'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person_add_rounded),
            title: Text('Miembro'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people_alt_rounded),
            title: Text('Quiero Ser Voluntario'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
