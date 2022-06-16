import 'package:flutter/material.dart';
import 'edit_inventory.dart';
import 'inventoryList.dart';
import 'inventoryitem.dart';
import 'inventoryList.dart';

List items = InventoryList.items;

class inventoryscreen extends StatefulWidget {


  @override
  State<inventoryscreen> createState() => _inventoryscreenState();
}

class _inventoryscreenState extends State<inventoryscreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Inventory"),),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index) {
            return Card(
              child: ListTile(title: Text(items[index].name+" x ${items[index].number}"),
                subtitle: Text("${items[index].price} kr."),
                trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){
                  setState((){items.remove(items[index]);});
                },),
                onTap: () async {
                  await Navigator.pushNamed(context, "/editing",arguments: index);
                  setState((){});
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${items[index].flag}"),
                ),),);
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState((){

          items.add(InventoryItem(name: "New item nr. ${items.length+1} ", number: 0, price: 0.0, flag: "YourDrinkLogo.png"));
        });
      },child: Icon(Icons.add),
      ),
    );
  }
}