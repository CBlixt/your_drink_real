import 'package:flutter/material.dart';
import 'package:your_drink_real/AdminFileManager.dart';
import 'package:your_drink_real/BrugerListe.dart';
import 'package:your_drink_real/FileManager.dart';
import 'package:your_drink_real/main.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    AdminFileManager.loadJsonData();
    navigateHome();
  }

  navigateHome() async{
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=>BrugerListe()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: const [
            SizedBox(
              width: 250.0,
                height: 250.0,
                child: Image(image: AssetImage('assets/YourDrinkLogo.png'),
            fit: BoxFit.cover)
            )
          ],
        ),
      ),
    );
  }
}
