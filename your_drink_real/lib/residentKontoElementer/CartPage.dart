import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryList.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';

import '../Bruger.dart';
//import 'package:softp_selv_yd/Objects/Kurv.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, this.user, this.drink, this.antal, this.kurv}) : super(key: key);
  final Bruger? user;
  final InventoryItem? drink;
  final int? antal;
  final List<InventoryItem>? kurv;



  @override
  State<CartPage> createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  //kurv kurv = new Kurv();

  //List<Drink?>? kurv =[];
  InventoryItem? selectedDrink;
  int? selectedIndex;
  double bottomHeight =60;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.green[200],
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
                    color: selectedIndex== index ? Colors.green[200] : Colors.white,
                    child: ListTile(
                      onTap: () {
                        InventoryItem instance = widget.kurv![index];
                        selectedDrink=instance;
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
                    color:Colors.green[400],
                    height: bottomHeight,
                    child: TextButton(
                      onPressed: (){ },


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
                      onPressed: (){},
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
