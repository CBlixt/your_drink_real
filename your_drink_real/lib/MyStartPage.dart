import 'package:flutter/material.dart';
import 'BrugerListe.dart';
import 'Bruger.dart';
import 'package:flutter/src/widgets/page_view.dart';

class MyStartPage extends StatefulWidget {
  const MyStartPage({Key? key, this.user}) : super(key: key);
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
          Text("Hej ${widget.user!.navn}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic )),
          SizedBox(height: 40),
          Text("Din gæld er: ${widget.user!.debt} kr.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ))],

        ),
      ),
    );
  }
}