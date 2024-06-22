import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  ThemeData getTheme() => ThemeData(
      brightness: Brightness.dark, // Dark theme settings
      textTheme: GoogleFonts.oswaldTextTheme().copyWith(
        displayLarge: GoogleFonts.oswald(color: Colors.white),
        displayMedium: GoogleFonts.oswald(color: Colors.white),
        displaySmall: GoogleFonts.oswald(color: Colors.white),
        headlineLarge: GoogleFonts.oswald(color: Colors.white),
        headlineMedium: GoogleFonts.oswald(color: Colors.white),
        headlineSmall: GoogleFonts.oswald(color: Colors.white),
        titleLarge: GoogleFonts.oswald(color: Colors.white),
        titleMedium: GoogleFonts.oswald(color: Colors.white),
        titleSmall: GoogleFonts.oswald(color: Colors.white),
        bodyLarge: GoogleFonts.lato(color: Colors.white),
        bodyMedium: GoogleFonts.lato(color: Colors.white),
        bodySmall: GoogleFonts.lato(color: Colors.white),
        labelLarge: GoogleFonts.lato(color: Colors.white),
        labelMedium: GoogleFonts.lato(color: Colors.white),
        labelSmall: GoogleFonts.lato(color: Colors.white),
      ),
      appBarTheme:
          const AppBarTheme(color: Color.fromRGBO(0, 0, 36, 1), elevation: 20),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 51, 127, 1)), // Color de fondo del botón
          textStyle: MaterialStateProperty.all<TextStyle>( // Estilo del texto del botón
            GoogleFonts.oswald(color: Colors.white, fontSize: 26),
          ),
        ),
      )

          
  );
}
