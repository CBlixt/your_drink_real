import 'package:flutter/material.dart';
import 'package:your_drink_real/Bruger.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/Inventory/edit_inventory.dart';
import 'package:your_drink_real/Loading.dart';
import 'package:your_drink_real/addResident.dart';
import 'package:your_drink_real/residentKontoElementer/LoadingUser.dart';
import 'package:your_drink_real/residentKontoElementer/MyStartPage.dart';
import 'package:your_drink_real/residentKontoElementer/shopdrink.dart';

import 'LoadingAdminEgenskaber.dart';
import 'editResident.dart';
import 'package:dcdg/dcdg.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Loading',
    routes: {
      '/shopdrink': (context) => ShopDrink(),
      '/Loading': (context) => LoadingScreen(),
      '/home': (context) => BrugerListe(),
      '/adminIndstillinger': (context) => LoadingAdminEgenskaber(),
      '/addResident': (context) => addResident(),
      '/editResident': (context) => editResident(),
      '/editing': (context) => EditInventory(),
      '/MyStartPage': (context) => const MyStartPage(
            index: 0,
          ),
      '/LoadingUser': (context) => const LoadingUser(
            index: 0,
          ),
    },
  ));
}
