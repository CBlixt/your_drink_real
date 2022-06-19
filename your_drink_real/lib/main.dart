
import 'package:flutter/material.dart';
import 'package:your_drink_real/Bruger.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/Inventory/edit_inventory.dart';
import 'package:your_drink_real/Loading.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/AdminIndstillinger.dart';
import 'package:your_drink_real/addResident.dart';
import 'package:your_drink_real/residentKontoElementer/LoadingUser.dart';
import 'package:your_drink_real/residentKontoElementer/MyStartPage.dart';

import 'LoadingAdminEgenskaber.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Loading',
    routes: {
      '/Loading': (context) => LoadingScreen(),
      '/home': (context) => BrugerListe(),
      '/adminIndstillinger': (context) => LoadingAdminEgenskaber(),
      '/addResident': (context) => addResident(),
      '/editing': (context) => EditInventory(),
      '/MyStartPage': (context) => MyStartPage(index: 0,),
      '/LoadingUser': (context) => LoadingUser(index: 0,),
    },
  ));
}
