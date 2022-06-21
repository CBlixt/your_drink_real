import 'package:flutter/material.dart';
import 'inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';

class EditInventory extends StatefulWidget {
  @override
  State<EditInventory> createState() => _EditInventory();
}

class _EditInventory extends State<EditInventory> {
  void updateItem(InventoryItem item, int index) async {
    InventoryFileManager.updateInventoryItem(item, index);
    Navigator.pop(context, {});
  }

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    InventoryItem item = InventoryFileManager.getData()[index];
    return Scaffold(
      backgroundColor: Colors.green[100],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          updateItem(item, index);
        },
        icon: const Icon(Icons.save),
        label: const Text('Update information'),
        backgroundColor: Colors.green[300],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/AppBarTittle2.png',
          fit: BoxFit.cover,
          height: 45,
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Edit inventory-item:',
            style: TextStyle(
                color: Colors.green[900],
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter item-name (currently: ' + item.name + ')',
                labelStyle: TextStyle(fontSize: 15),
              ),
              onSubmitted: (String name) {
                item.name = name;
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter number of items (currently: ${item.number})",
                labelStyle: TextStyle(fontSize: 15),
              ),
              onSubmitted: (String value) {
                try {
                  var newValue = int.parse(value);
                  item.number = newValue;
                } catch (err) {}
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter item-price (currently: ${item.price})",
                labelStyle: TextStyle(fontSize: 15),
              ),
              onSubmitted: (String value) {
                try {
                  var newValue = double.parse(value);
                  item.price = newValue;
                } catch (err) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
