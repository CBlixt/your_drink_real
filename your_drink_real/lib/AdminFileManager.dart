import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:your_drink_real/Admin.dart';

class AdminFileManager {

  static List<Admin> _admins = [];

  static List<Admin> getData() {
    return _admins;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/Admin.json');
  }

  static Future<File> writeCounter(String encodedjson) async {
    final file = await _localFile;

// Write the file
    return await file.writeAsString(encodedjson);
  }

  static Future<String> loadJsonData() async {
    var jsonText = await _localFile;
    if (await jsonText.exists()) {
      String jsonStr = await jsonText.readAsString();
      var decoded = jsonDecode(jsonStr) as List<dynamic>;
      _admins = decoded.map((e) => Admin.fromJson(e)).toList();
    } else {
      _admins = [];
      AdminFileManager.createAdmin();
      print('empty');
    }
    return 'success';
  }

  static void updateAdminCode(int code) async {
    if(code.toString().isEmpty == true) {
      return;
    }
    _admins[0].code = code;
    String encodedjson = jsonEncode(_admins);
    print('xD $encodedjson');
    await writeCounter(encodedjson);
  }

  static void createAdmin() async {

    while(_admins.isEmpty == true) {
      print(_admins.isEmpty);
      _admins.add(Admin(name: 'Admin', code: 0));
      String encodedjson = jsonEncode(_admins);
      print('create admin: $encodedjson');
      await writeCounter(encodedjson);
    }
  }






}
