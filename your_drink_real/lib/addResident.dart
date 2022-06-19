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

  void saveInfo(User user, int index) async {
    if (index == -1) {
      FileManager.addUser(user);
    } else {
      FileManager.updateUser(user, index);
    }
    Navigator.pop(context, {
    });
  }


  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    print(index);

    User user = User(id: 'id', name: 'name', imageURL: 'imageURL', husnummer: 'husnummer', debt: 0.0);


    if (index != -1) {
      User user = FileManager.getData()[index];
    } else {
      print('new user');
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {saveInfo(user, index);},
        icon: const Icon(Icons.save),
        label: const Text('Add resident / Update information'),
        backgroundColor: Colors.indigoAccent,
      ),
      appBar: AppBar(title: Text("Enter resident-informations below:"),
        automaticallyImplyLeading: false,),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: user.name
          ),onSubmitted: (String name){
            user.name=name;
          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${user.husnummer}"
          ),onSubmitted: (String value){
              user.husnummer=value;
          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${user.debt}"
          ),onSubmitted: (String value){
            try{
              var newValue = double.parse(value);
              user.debt=newValue;
            }catch(err){
            }
          },
          ),],

    ),);
  }



}