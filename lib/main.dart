import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/config/palette.dart';
import 'package:tmdb/screens/home_splash.dart';
import 'package:tmdb/screens/onboarding/onboarding_screen.dart';
import './screens/auth/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB',
      home: OnboadingScreen(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.mulishTextTheme(),
        accentColor: Palette.darkOrange,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
          color: Palette.darkBlue,
        ),
      ),
      routes: {
        'home': (context) => OnboadingScreen(),
        'auth-screen': (context) => AuthScreen(),
      },
    );
  }
}
