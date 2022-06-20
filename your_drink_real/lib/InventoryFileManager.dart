import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';

class InventoryFileManager {

  static List<InventoryItem> _InventoryItems = [];

  static List<InventoryItem> getData() {
    return _InventoryItems;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/InventoryItem.json');
  }

  static Future<File> writeCounter(String encodedjson) async {
    final file = await _localFile;

// Write the file
    return file.writeAsString(encodedjson);
  }

  static Future<String> loadJsonData() async {
    var jsonText = await _localFile;
    if (await jsonText.exists()) {
      String jsonStr = await jsonText.readAsString();
      var decoded = jsonDecode(jsonStr) as List<dynamic>;
      _InventoryItems = decoded.map((e) => InventoryItem.fromJson(e)).toList();
    } else {
      _InventoryItems = [];
      print('empty');
    }

    return 'success';
  }

  static void addInventoryItem(InventoryItem InventoryItem) async {
    _InventoryItems.add(InventoryItem);
    String encodedjson = jsonEncode(_InventoryItems);
    await writeCounter(encodedjson);
  }

  static void updateInventoryItem(InventoryItem  item, int index) async {
    _InventoryItems[index].name = item.name;
    _InventoryItems[index].number = item.number;
    _InventoryItems[index].price = item.price;
    String encodedjson = jsonEncode(_InventoryItems);
    await writeCounter(encodedjson);
  }

  static void deleteInventoryItem(int index) async {
    _InventoryItems.remove(_InventoryItems[index]);
    String encodedjson = jsonEncode(_InventoryItems);
    await writeCounter(encodedjson);
  }

  static void updateInventoryCount() async {
    String encodedjson = jsonEncode(_InventoryItems);
    await writeCounter(encodedjson);
  }




}
