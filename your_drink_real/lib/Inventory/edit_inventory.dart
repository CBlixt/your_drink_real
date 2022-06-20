import 'package:flutter/material.dart';
import 'edit_inventory.dart';
import 'inventoryList.dart';
import 'inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';
class EditInventory extends StatefulWidget {

  @override
  State<EditInventory> createState() => _EditInventory();
  }

  class _EditInventory extends State<EditInventory> {

  void updateItem(InventoryItem item, int index) async {
  InventoryFileManager.updateInventoryItem(item, index);
  Navigator.pop(context, {
  });
  }


  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    InventoryItem item = InventoryFileManager.getData()[index];
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () { updateItem(item, index);},
        icon: const Icon(Icons.save),
        label: const Text('Add resident / Update information'),
        backgroundColor: Colors.indigoAccent,
      ),
      appBar: AppBar(title: Text("Edit"),
        automaticallyImplyLeading: false,),
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