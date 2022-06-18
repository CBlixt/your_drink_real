import 'package:flutter/material.dart';
import '../Bruger.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:your_drink_real/brugerList.dart';

import '../FileManager.dart';

class MyStartPage extends StatefulWidget {
  const MyStartPage({Key? key, this.user, required this.index}) : super(key: key);
  final int index;
  final Bruger? user;
  @override
  State<MyStartPage> createState() => _MyStartPageState();
}

class _MyStartPageState extends State<MyStartPage> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Container(
        child: Column(children: <Widget> [
          SizedBox(height: 50),
          Text("Hej ${FileManager.getData()[widget.index].name}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic )),
          SizedBox(height: 40),
          Text("Din gæld er: ${FileManager.getData()[widget.index].debt} kr.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ))],

        ),
      ),
    );
  }
}