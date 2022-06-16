import 'package:flutter/material.dart';
import 'package:your_drink_real/brugerList.dart';

import 'Bruger.dart';

class addResident extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
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
          },),],
      ),
    );
  }
}