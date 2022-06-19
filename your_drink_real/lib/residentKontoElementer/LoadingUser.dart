import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import '../Bruger.dart';
import '../BrugerListe.dart';
import 'CartPage.dart';
import 'SelectDrinks.dart';
import 'MyStartPage.dart';

class LoadingUser extends StatefulWidget {

  //const LoadingUser({Key? key, this.user, this.inventarListe, this.kurv}) : super(key: key);
  const LoadingUser({Key? key, this.user, required this.index}) : super(key: key);
  final Bruger? user;
  final int index;

  //final List<Drink>? kurv;

  @override
  State<LoadingUser> createState() => _LoadingUserState();
}

class _LoadingUserState extends State<LoadingUser> {


  int currentPageIndex = 0;
  double bottomHeight =60;

  List<InventoryItem>? kurv=[];

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
          MyStartPage(user:widget.user, index:widget.index),
          SelectDrinks(kurv: kurv,),
          CartPage(kurv: kurv,index: widget.index,),
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

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,
              color: _selectedIndex == 3 ? Colors.green : Colors.black,
            ),
            label: 'Kurv',
          ),
        ],
      ),
    );
  }
}