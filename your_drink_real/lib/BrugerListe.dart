import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_drink_real/brugerList.dart';
import 'Bruger.dart';
import 'Users.dart';
import 'addResident.dart';




class BrugerListe extends StatefulWidget {
  const BrugerListe({Key? key}) : super(key: key);

  @override
  State<BrugerListe> createState() => _BrugerListeState();
}


class _BrugerListeState extends State<BrugerListe> {

  Future<List<ProductDataModel>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/users.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

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
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.green[100],
                                      ),
                                      backgroundColor: Colors.green[300],
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
                                            onPressed: () {
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
                                                Navigator.pushNamed(
                                                    context, '/adminIndstillinger');
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
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.green[100],
                                      ),
                                      backgroundColor: Colors.green[300],
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
                                            onPressed: () {
                                              if (myController3.text == kode) {
                                                myController3.clear();
                                                Navigator.pushNamed(
                                                    context, '/adminIndstillinger');
                                                setState((){});
                                              } else {
                                                print('con3: ' +
                                                    myController3.text +
                                                    ' kode: ' +
                                                    kode);
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
            child:  FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  //in case if error found
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  //once data is ready this else block will execute
                  // items will hold all the data of DataModel
                  //items[index].name can be used to fetch name of product as done below
                  var items = data.data as List<ProductDataModel>;
                  return ListView.builder(
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(':)');
                          },
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image:
                                      NetworkImage(items[index].imageURL.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 8, right: 8),
                                              child: Text(
                                                items[index].name.toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8, right: 8),
                                              child: Text('husnummer: ${items[index].husnummer.toString()}'),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  // show circular progress while data is getting fetched from json file
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),

            // Old code -------------------------------------------------------------------------------
            /*
            child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
              return Card(
                child: ListTile(title: Text(users[index].navn),subtitle: Text(users[index].husnummer),),
              );
            }), Old code -------------------------------------------------------------------------------
            */
          )
        ],
      ),
    );
  }
}