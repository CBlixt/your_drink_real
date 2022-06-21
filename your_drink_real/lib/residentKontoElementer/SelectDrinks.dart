import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';

class SelectDrinks extends StatefulWidget {
  const SelectDrinks({Key? key, this.kurv}) : super(key: key);

  final List<InventoryItem>? kurv;

  @override
  State<SelectDrinks> createState() => _SelectDrinksState();
}

class _SelectDrinksState extends State<SelectDrinks> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  double bottomHeight =60;

  void _clearCounter() {
    setState(() {
      _counter=0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState((){
      if(_counter>0) {
        _counter--;
      }
    });
  }

  bool antalOK() {
    int itemsInKurv = 0;

    widget.kurv!.forEach((drink) {
      if (drink.name == selectedDrink!.name) {
        itemsInKurv++;
      };
    });

    int invindex = 0;
    for(int i = 0; i < InventoryFileManager.getData().length; i++) {
      if (selectedDrink!.name == InventoryFileManager.getData()[i].name) {
        invindex = i;
      }
    }

    // int itemsInInventory = InventoryList.items[InventoryList.items.indexOf(selectedDrink!)].number;
    int itemsInInventory = InventoryFileManager.getData()[invindex].number;
    if(itemsInKurv+_counter<=itemsInInventory){
      return true;
    }
    return false;
  }

  InventoryItem? selectedDrink;

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
backgroundColor: Colors.green[100],
      body:Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: InventoryFileManager.getData().length,
                  itemBuilder: (context, index){
                    return Card(
                      color: selectedIndex == index ? Colors.green[200] : Colors.white,
                      child: ListTile(
                        onTap: () {
                          InventoryItem instance = InventoryFileManager.getData()[index];
                          selectedDrink = instance;
                          setState((){
                            selectedIndex=index;
                          });
                        },
                        selected: index == selectedDrink,
                        title: Text(InventoryFileManager.getData()[index].name),
                        trailing: Text('${InventoryFileManager.getData()[index].price} kr.'),
                      ),
                    );
                  }),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color:Colors.green[400],
                      height: bottomHeight,
                      //padding: EdgeInsets.all(25),
                      child: Center(
                        child: Text(
                          '$_counter',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child:Container(
                      color:Colors.green[400],
                      height: bottomHeight,
                      child: TextButton(
                        onPressed: (){
                          _counter++;
                          if(antalOK()){
                            setState(() {
                            });
                          } else{_counter--;
                          setState(() {
                          });
                          };
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color: Colors.green[400],
                      height: bottomHeight,
                      child: TextButton(
                        onPressed: _decrementCounter,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color:Colors.green[400],
                      height: bottomHeight,
                      child: TextButton(
                        onPressed: (){
                          if(_counter>0) {
                            if (antalOK()) {
                              int? antalDrinks = _counter;
                              for (int? count = 1; count! <= antalDrinks; count++) {
                                widget.kurv?.add(selectedDrink!);
                              }
                              _clearCounter();
                            }
                          }

                        },
                        style: TextButton.styleFrom(
                          primary: Colors.green[900],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color:Colors.green[400],
                      height: bottomHeight,
                      child: TextButton(
                        onPressed: _clearCounter,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override

  bool get wantKeepAlive => true;
}
