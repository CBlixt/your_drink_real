import 'package:flutter/material.dart';
import 'edit_inventory.dart';
import 'inventoryList.dart';
import 'inventoryitem.dart';
class EditInventory extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    InventoryItem item = InventoryList.items[index];
    return Scaffold(
      appBar: AppBar(title: Text("Edit"),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: item.name
          ),onSubmitted: (String name){
            item.name=name;
          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${item.number}"
          ),onSubmitted: (String value){
            try{
              var newValue = int.parse(value);
              item.number=newValue;
            }catch(err){

            }
          },),
          TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),labelText: "${item.price}"
          ),onSubmitted: (String value){
            try{
              var newValue = double.parse(value);
              item.price=newValue;
            }catch(err){

            }
          },),],
      ),
    );
  }
}