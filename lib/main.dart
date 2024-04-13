import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_defensa_civil/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_defensa_civil/Theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final Defensa Civil',
      darkTheme: Apptheme().getTheme(),
      theme: ThemeData(
        brightness: Brightness.light, // Light theme settings
        textTheme: GoogleFonts.oswaldTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Defensa Civil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navbar(),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.onTertiary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.ibb.co/3p2VXtV/def-civil-fondo2.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors
                        .black26, // Ajusta la opacidad para oscurecer más o menos
                    BlendMode
                        .darken, // El BlendMode puede ser darken, multiply, etc.
                  ),
                  fit: BoxFit.cover),
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
      
    );
  }
}
