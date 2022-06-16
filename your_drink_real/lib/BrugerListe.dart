import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_drink_real/brugerList.dart';
import 'Bruger.dart';
import 'addResident.dart';


class BrugerListe extends StatefulWidget {
  const BrugerListe({Key? key}) : super(key: key);

  @override
  State<BrugerListe> createState() => _BrugerListeState();
}

class _BrugerListeState extends State<BrugerListe> {
 List<Bruger> users =brugerList.users;

  final _formKey = GlobalKey<FormState>();
  final _codeKey1 = GlobalKey<FormState>();
  final _codeKey2 = GlobalKey<FormState>();
  final _codeKey3 = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  var admin = "Press to add admin";
  var kode;
  var firstTimeLoggingIn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('List over residents'),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              FlatButton(
                onPressed: () {
                  if (firstTimeLoggingIn == 0) {
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  top: -35.0,
                                  right: 235.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Create a 4-digit code:'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          key: _codeKey1,
                                          controller: myController1,
                                          decoration: InputDecoration(
                                              labelText: 'Enter code'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          key: _codeKey2,
                                          controller: myController2,
                                          decoration: InputDecoration(
                                              labelText: 'Enter code again'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green[900]),
                                            ),
                                            color: Colors.green[100],
                                            onPressed: () async {
                                              if (myController1.text ==
                                                  myController2.text) {
                                                //navigér til næste viindue
                                                //ellers så kom med en "hov koden var ikke den samme" besked
                                                admin = "Admin-profile";
                                                firstTimeLoggingIn += 1;
                                                kode = myController1.text;
                                                print('kode' + kode);
                                                myController1.clear();
                                                myController2.clear();
                                                await Navigator.pushNamed(
                                                    context, '/adminIndstillinger');
                                                setState((){});

                                              }

                                            }),
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
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  top: -35.0,
                                  right: 235.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Enter admin-code'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          key: _codeKey3,
                                          controller: myController3,
                                          decoration: InputDecoration(
                                              labelText: 'Enter code'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green[900]),
                                            ),
                                            color: Colors.green[100],
                                            onPressed: () async {
                                              if (myController3.text == kode) {
                                                myController3.clear();

                                                await Navigator.pushNamed(
                                                    context, '/adminIndstillinger');
                                                setState((){});
                                                setState((){});
                                              } else {
                                                print('con3: ' +
                                                    myController3.text +
                                                    ' kode: ' +
                                                    kode);
                                              }

                                              setState((){});
                                            }),
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
                child: Text(
                  admin,
                ),
                minWidth: 350,
                height: 70,
                color: Colors.green[300],
              ),

            ],
          ),
          Expanded(
            child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
              return Card(
                child: ListTile(title: Text(users[index].navn),subtitle: Text(users[index].husnummer),),
              );
            }),
          )
        ],
      ),
    );
  }
}