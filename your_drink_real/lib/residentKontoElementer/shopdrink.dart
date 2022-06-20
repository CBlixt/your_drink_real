import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
List items = InventoryList.items;
class ShopDrink extends StatefulWidget {


  @override
  State<ShopDrink> createState() => _ShopDrinkState();
}

class _ShopDrinkState extends State<ShopDrink> {
  @override
  Widget build(BuildContext context) {



    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index) {
          return Card(
            child: ListTile(title: Text(items[index].name),
              subtitle: Text("${items[index].price} kr."),
              onTap: () async {
                Navigator.pop(context,items[index].name);

              },
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${items[index].flag}"),
              ),),);
        }
    );
  }
}