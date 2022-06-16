import 'package:flutter/material.dart';
import 'package:your_drink_real/brugerList.dart';

import 'package:your_drink_real/main.dart';

import 'Bruger.dart';

class AdminIndstillinger extends StatefulWidget {
  const AdminIndstillinger({Key? key}) : super(key: key);

  @override
  State<AdminIndstillinger> createState() => _AdminIndstillingerState();
}

class _AdminIndstillingerState extends State<AdminIndstillinger> {
  List<Bruger> users = brugerList.users;
  final _formKeyAdmin = GlobalKey<FormState>();
  final _codeKeyAdmin1 = GlobalKey<FormState>();
  final _codeKeyAdmin2 = GlobalKey<FormState>();
  final myControllerAdmin1 = TextEditingController();
  final myControllerAdmin2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Admin-instillinger'),
        backgroundColor: Colors.green[200],
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 100,
        ),
        FlatButton(
          onPressed: ()async {
            print('hej');
            users.add(Bruger(navn: "Navn", husnummer: "Væresels nummer"));
            await Navigator.pushNamed(
                context, '/addResident',arguments:users.length-1);
            setState((){});

          },
          child: Text('Add a resident'),
          minWidth: 350,
          height: 70,
          color: Colors.green[300],
        ),
      ]),
    );
  }
}