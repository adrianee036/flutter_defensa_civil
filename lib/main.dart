import 'package:flutter/material.dart';
import 'package:flutter_defensa_civil/Extras/acerca_de.dart';
import 'package:flutter_defensa_civil/Extras/iniciar_seccion.dart';
import 'package:flutter_defensa_civil/Post%20Login/pass.dart';
import 'package:flutter_defensa_civil/Theme/dark_theme.dart';
import 'package:flutter_defensa_civil/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final Defensa Civil',
      darkTheme: Apptheme().getTheme(),
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.oswaldTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Defensa Civil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
      switch (_currentPageIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()), // Llama a la primera aplicación
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AcercaDe()), // Llama a la primera aplicación
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Contrasena()), // Llama a la primera aplicación
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.ibb.co/3p2VXtV/def-civil-fondo2.jpg',
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //Padding()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onPageChanged,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            activeIcon: Icon(Icons.login_rounded),
            label: 'Iniciar Seccion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.present_to_all_outlined),
            activeIcon: Icon(Icons.present_to_all_rounded),
            label: 'Acerca de',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key_outlined),
            activeIcon: Icon(Icons.key_rounded),
            label: 'Contraseña',
          ),
        ],
      ),
    );
  }
}
