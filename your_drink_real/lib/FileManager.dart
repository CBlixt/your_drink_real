import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:your_drink_real/Users.dart';
import 'Users.dart';

class FileManager {
  static void jsonTest(List data) {
    List players = data;
    User newPlayer =
        User(id: '1', name: 'lol', imageURL: 'lol', husnummer: 'xD', debt: 2.5);
    players.add(newPlayer);
    String encoded = jsonEncode(players);
    print(encoded);
  }

  static List<User> _data = [];

  static List<User> getData() {
    return _data;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
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
      _data = decoded.map((e) => User.fromJson(e)).toList();
    } else {
      _data = [];
      print('empty');
    }

    return 'success';
  }

  static void addUser(User user) async {
    _data.add(user);
    String encodedjson = jsonEncode(_data);
    await writeCounter(encodedjson);
  }
}