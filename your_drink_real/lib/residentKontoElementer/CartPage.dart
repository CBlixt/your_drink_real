import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';

import '../Bruger.dart';
import '../FileManager.dart';
import '../Users.dart';
import 'LoadingUser.dart';
//import 'package:softp_selv_yd/Objects/Kurv.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, this.drink, this.antal, this.kurv,required this.index}) : super(key: key);
  final InventoryItem? drink;
  final int? antal;
  final int? index;
  final List<InventoryItem>? kurv;



  @override
  State<CartPage> createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  void saveInfo(double debt, int index) async {
      FileManager.saveDebt(debt, index);
      updateCount();
    //Navigator.pop(context, {
      //});
    Navigator.push(context, MaterialPageRoute(builder:
     (context)=>LoadingUser(index:widget.index!)));
  }

  double totalPrice() {
    double totalPrice = 0;
    int size = widget.kurv!.length;
    for(int i = 0; i < size; i++) {
     totalPrice += widget.kurv![i].price;
    }
    return totalPrice;
  }

  void updateCount() {
    for(int i = 0; i < widget.kurv!.length; i++ ) {
      for(int h = 0; h < InventoryFileManager.getData().length; h++) {
        if(widget.kurv![i].name == InventoryFileManager.getData()[h].name) {
          InventoryFileManager.getData()[h].number += -1;
        }
      }
    }
    InventoryFileManager.updateInventoryCount();
  }

  //kurv kurv = new Kurv();

  //List<Drink?>? kurv =[];
  InventoryItem? selectedDrink;
  int? selectedIndex;
  double bottomHeight =60;

  List<int> selectedDrinksIndex = [];




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      backgroundColor: Colors.green[100],
      body: Container(
        child: Stack(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 70.0, 0, 70.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.kurv?.length,
                itemBuilder: (context,index)
                {
                  return Card(
                    color: selectedDrinksIndex.contains(index) ? Colors.green[100] : Colors.white,
                    child: ListTile(
                      onTap: () {
                        InventoryItem instance = widget.kurv![index];

                        selectedDrinksIndex.contains(index) ? selectedDrinksIndex.remove(index) : selectedDrinksIndex.add(index);
                        setState((){
                          selectedIndex=index;
                        });
                      },
                      //selected: index==selectedDrink,
                      title: Text("${widget.kurv?[index]?.name}"),
                      trailing: Text("${widget.kurv?[index]?.price} kr."),
                      /*leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/person.png'),

                       */
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color:selectedDrinksIndex.isEmpty ? Colors.green[400] : Colors.green[100],
                    height: bottomHeight,
                    child: TextButton(
                      onPressed: () {
                         if(selectedDrinksIndex.isEmpty){
                          saveInfo(totalPrice(), widget.index ?? 0);
                          widget.kurv!.clear();
                          selectedDrinksIndex.clear();
                        }
                        setState(() {
                          widget.kurv;
                        });
                      },

                      style: TextButton.styleFrom(
                        primary: Colors.green[900],
                      ),
                      child:  Icon(
                        Icons.check,
                        color:selectedDrinksIndex.isEmpty ? Colors.white : Colors.green[100]),
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
                        if(selectedDrinksIndex.isNotEmpty) {
                          selectedDrinksIndex.sort();
                          for(int count=selectedDrinksIndex.length-1; count>=0; count--){
                            widget.kurv!.removeAt(selectedDrinksIndex[count]);
                          }
                          selectedDrinksIndex.clear();
                          setState(() {
                            widget.kurv;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,),
                    ),
                  ),
                ),
              ],

            ),

          )

        ],

        ),
      ),

    );
  }


  @override

  bool get wantKeepAlive => true;
}
