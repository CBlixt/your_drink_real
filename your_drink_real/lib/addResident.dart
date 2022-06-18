import 'dart:convert';
import 'package:your_drink_real/FileManager.dart';
import 'Users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_drink_real/Users.dart';
import 'package:your_drink_real/brugerList.dart';
import 'Bruger.dart';




class addResident extends StatefulWidget {

  @override
  State<addResident> createState() => _addResident();
}

class _addResident extends State<addResident> {



  Future<List<User>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('jsonfile/users.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => User.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {

    Future<List<User>> Users = ReadJsonData();

    print(Users);



    final index = ModalRoute.of(context)!.settings.arguments as int;
    Bruger bruger = brugerList.users[index];
    return Scaffold(
      appBar: AppBar(title: Text("Enter resident-informations below:"),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: bruger.navn
          ),onSubmitted: (String name){
            bruger.navn=name;
          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${bruger.husnummer}"
          ),onSubmitted: (String value){
              bruger.husnummer=value;

          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${bruger.debt}"
          ),onSubmitted: (String value){
            try{
              var newValue = double.parse(value);
              bruger.debt=newValue;
            }catch(err){
            }
          },),
        FloatingActionButton(onPressed: () {
          User test = User(id: '4', name: 'joe', imageURL: 'lol', husnummer: 'husnummer', debt: 4.6);
          FileManager.addUser(test);

        },),],
      ),
    );
  }



}