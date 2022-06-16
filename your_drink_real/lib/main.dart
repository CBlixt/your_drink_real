import 'package:flutter/material.dart';
import 'package:your_drink_real/Bruger.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/Loading.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/AdminIndstillinger.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/Loading',
    routes: {
      '/Loading': (context) => LoadingScreen(),
      '/home': (context) => BrugerListe(),
      '/adminIndstillinger': (context) => AdminIndstillinger(),
    },
  ));
}
