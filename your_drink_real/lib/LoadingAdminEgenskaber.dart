import 'package:flutter/material.dart';
import 'package:your_drink_real/AdminIndstillinger.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'package:your_drink_real/Inventory/inventory_screen.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/addResident.dart';
import '../Bruger.dart';
import '../BrugerListe.dart';

class LoadingAdminEgenskaber extends StatefulWidget {
  //const LoadingUser({Key? key, this.user, this.inventarListe, this.kurv}) : super(key: key);

  //final List<Drink>? kurv;

  @override
  State<LoadingAdminEgenskaber> createState() => _LoadingAdminEgenskaberState();
}

class _LoadingAdminEgenskaberState extends State<LoadingAdminEgenskaber> {

  int currentPageIndex = 0;
  double bottomHeight =60;


  PageController? _pageController = PageController();

  int _selectedIndex = 0;

  void _onPageChanged(int index){
    setState((){
      _selectedIndex = index;


    });
  }

  void _onItemTapped(int selectedIndex){
    _pageController?.jumpToPage(selectedIndex);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        title: Text('YourDrink'),
      ),
      body: PageView(
        controller: _pageController,
        children: //_screens,
        <Widget> [
          AdminIndstillinger(),
          inventoryscreen(),
        ],



        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: _selectedIndex == 0 ? Colors.green : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop,
              color: _selectedIndex == 1 ? Colors.green : Colors.black,
            ),
            label: 'Drikkevarer',
          ),


        ],
      ),
    );
  }
}