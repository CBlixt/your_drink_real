import 'package:flutter/material.dart';
import 'package:your_drink_real/AdminIndstillinger.dart';
import 'package:your_drink_real/Inventory/inventory_screen.dart';

class LoadingAdminEgenskaber extends StatefulWidget {
  @override
  State<LoadingAdminEgenskaber> createState() => _LoadingAdminEgenskaberState();
}

class _LoadingAdminEgenskaberState extends State<LoadingAdminEgenskaber> {
  int currentPageIndex = 0;
  double bottomHeight = 60;

  PageController? _pageController = PageController();

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController?.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/AppBarTittle2.png',
          fit: BoxFit.cover,
          height: 45,
        ),
        backgroundColor: Colors.green[200],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: //_screens,
            <Widget>[
          const AdminIndstillinger(),
          inventoryscreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.green : Colors.black,
            ),
            label: 'Resident',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.water_drop,
              color: _selectedIndex == 1 ? Colors.green : Colors.black,
            ),
            label: 'Inventory',
          ),
        ],
      ),
    );
  }
}
