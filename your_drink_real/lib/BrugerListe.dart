import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_drink_real/FileManager.dart';
import 'package:your_drink_real/brugerList.dart';
import 'package:your_drink_real/residentKontoElementer/LoadingUser.dart';
import 'Bruger.dart';
import 'Users.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'addResident.dart';

import 'dart:async' show Future;
import 'package:path_provider/path_provider.dart';
import 'package:your_drink_real/InventoryFileManager.dart';
import 'package:your_drink_real/AdminFileManager.dart';

class BrugerListe extends StatefulWidget {
  const BrugerListe({Key? key}) : super(key: key);

  @override
  State<BrugerListe> createState() => _BrugerListeState();
}

class _BrugerListeState extends State<BrugerListe> {
  @override
  void initState() {
    super.initState();
    FileManager.loadJsonData();
    InventoryFileManager.loadJsonData();
  }

  Future<List<User>> readJsonData() async {
    //read json file
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/users.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => User.fromJson(e)).toList();
  }

  List<Bruger> users = brugerList.users;

  final _formKey = GlobalKey<FormState>();
  final _codeKey1 = GlobalKey<FormState>();
  final _codeKey2 = GlobalKey<FormState>();
  final _codeKey3 = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  var admin = "Press to add admin";

  @override
  Widget build(BuildContext context) {
    FileManager.loadJsonData();

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/AppBarTittle2.png',
          fit: BoxFit.cover,
          height: 45,
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              FlatButton(
                onPressed: () {
                  if (AdminFileManager.getData()[0].code == 0) {
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return AlertDialog(
                            content: Stack(
                              //clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  height: 500,

                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Text('Create a 4-digit code:'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: TextFormField(
                                          key: _codeKey1,
                                          controller: myController1,
                                          decoration: const InputDecoration(
                                              labelText: 'Enter code'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: TextFormField(
                                          key: _codeKey2,
                                          controller: myController2,
                                          decoration: const InputDecoration(
                                              labelText: 'Enter code again'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: RaisedButton(
                                            color: Colors.green[100],
                                            onPressed: () async {
                                              if (myController1.text ==
                                                      myController2.text &&
                                                  myController1.text.length ==
                                                      4 &&
                                                  myController2.text.length ==
                                                      4) {
                                                admin = "Admin-profile";
                                                print(AdminFileManager.getData());
                                                var n1 = int.parse(myController1.text);
                                                AdminFileManager.updateAdminCode(n1);

                                                Navigator.pop(context);
                                                print(AdminFileManager.getData()[0].code);
                                                myController1.text='';
                                                myController2.text='';
                                                await Navigator.pushNamed(
                                                    context,
                                                    '/adminIndstillinger');
                                                setState(() {AdminFileManager.updateAdminCode(n1);});
                                              }
                                            },
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green[900]),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return AlertDialog(
                            content: Stack(
                              //clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  height: 200,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Text('Enter admin-code'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: TextFormField(
                                          key: _codeKey3,
                                          controller: myController3,
                                          decoration: const InputDecoration(
                                              labelText: 'Enter code'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: RaisedButton(
                                            color: Colors.green[100],
                                            onPressed: () async {
                                              if (myController3.text == AdminFileManager.getData()[0].code.toString()) {
                                                myController3.clear();
                                                Navigator.pop(context);
                                                await Navigator.pushNamed(
                                                    context,
                                                    '/adminIndstillinger');
                                                setState(() {});
                                                setState(() {});
                                              }
                                              setState(() {});
                                            },
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green[900]),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                },
                minWidth: 350,
                height: 70,
                color: Colors.green[300],
                child: Text(
                  admin,
                  style: TextStyle(
                      color: Colors.green[50], fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: FileManager.getData().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        FileManager.getData()[index].name ?? 'null'
                      ),
                      subtitle: Text(
                        'værelsesnummer: ${FileManager.getData()[index].husnummer ?? 1.0}',
                        style: TextStyle(

                        ),
                      ),
                      onTap: () async {
                        User instance = FileManager.getData()[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadingUser(
                                      index: index,
                                    )));
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
