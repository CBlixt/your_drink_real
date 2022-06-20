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


  Future<List<User>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/users.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => User.fromJson(e)).toList();
  }

 List<Bruger> users =brugerList.users;

  Bruger bruger = Bruger(navn: "",husnummer: "",debt: 0.0);

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

    FileManager.loadJsonData();


    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/AppBarTittle2.png', fit: BoxFit.cover,height: 45,),


        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
        //SizedBox(
        //height: 10,),

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
                                  width: 200,
                                  height: 200,
                                  top: -35.0,
                                  right: 235.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },/*
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
                                    */
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Text('Create a 4-digit code:'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(9.0),
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
                                        padding: EdgeInsets.all(9.0),
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
                                        padding: const EdgeInsets.all(9.0),
                                        child: RaisedButton(
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.green[900]),
                                            ),
                                            color: Colors.green[100],
                                            onPressed: () async {
                                              if (myController1.text ==
                                                  myController2.text && myController1.text.length==4 &&
                                              myController2.text.length==4) {
                                               admin = "Admin-profile";
                                                firstTimeLoggingIn += 1;
                                                kode = myController1.text;

                                                Navigator.pop(context);

                                                myController1.clear();
                                                myController2.clear();
                                                await Navigator.pushNamed(
                                                    context,
                                                    '/adminIndstillinger');
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
                                  width: 200,
                                  height: 200,
                                  top: -35.0,
                                  right: 235.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },/*
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
                                    */
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
                                                Navigator.pop(context);
                                                await Navigator.pushNamed(
                                                    context, '/adminIndstillinger');
                                                setState((){});
                                                setState((){});
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
                  style: TextStyle(
                      color: Colors.green[50],
                      fontWeight: FontWeight.bold
                  ),
                ),
                minWidth: 350,
                height: 70,
                color: Colors.green[300],
              ),

            ],
          ),
          /*Text(
            'List over residents',
            style: TextStyle(
                fontSize: 20,
                color: Colors.green[900],
                fontWeight: FontWeight.bold
            ),

          ),
          SizedBox(height:10,),
          */
          Expanded(
            /*
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
                  var items = data.data as List<User>;
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
*/
            // Old code -------------------------------------------------------------------------------
            child: ListView.builder(itemCount: FileManager.getData().length,itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(
                      FileManager.getData()[index].name ?? 'null',
                    style: TextStyle(
                       // color: Colors.green[900],
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                    subtitle: Text(
                      'værelsesnummer: ${FileManager.getData()[index].husnummer ?? 1.0}',
                      style: TextStyle(
                        //color: Colors.green[900],

                      ),
                    ),
                  onTap: () async {
                    User instance = FileManager.getData()[index];
                   Navigator.push(
                      context,MaterialPageRoute(builder: (context)=>LoadingUser(index: index,))
                   );


                  },
                ),
              );
            }), //Old code -------------------------------------------------------------------------------

          )
        ],
      ),
    );
  }
}