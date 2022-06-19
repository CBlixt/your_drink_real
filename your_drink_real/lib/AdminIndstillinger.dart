import 'package:flutter/material.dart';
import 'package:your_drink_real/brugerList.dart';

import 'package:your_drink_real/main.dart';

import 'Bruger.dart';
import 'FileManager.dart';

class AdminIndstillinger extends StatefulWidget {
  const AdminIndstillinger({Key? key}) : super(key: key);

  @override
  State<AdminIndstillinger> createState() => _AdminIndstillingerState();
}

class _AdminIndstillingerState extends State<AdminIndstillinger> {
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
        title: Text('Bruger-indstillinger'),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 100,
            ),
            FlatButton(
              onPressed: ()async {
                await Navigator.pushNamed(context, '/addResident',arguments:-1);
                setState((){ });

              },
              child: Text('Add a resident'),
              minWidth: 350,
              height: 70,
              color: Colors.green[300],
            ),

          ]),

          Expanded(
            child: ListView.builder(itemCount: FileManager.getData().length,itemBuilder: (context,index){
              return Card(
                child: ListTile(
                    title: Text(FileManager.getData()[index].name ?? 'null'),
                    subtitle: Text(FileManager.getData()[index].husnummer ?? 'null'),
                    onTap: () async {
                      await Navigator.pushNamed(
                          context, '/addResident', arguments: index);
                      setState(() {});

                    },

                   ),

              );

            }),
          )
        ],
      ),
    );
  }
}