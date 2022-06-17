import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';

import 'Bruger.dart';
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



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.kurv?.length,
          itemBuilder: (context,index)
          {
            return Card(
              child: ListTile(
                onTap: () {
                  //Drink? instance = widget.kurv?[index];
                },
                title: Text("${widget.kurv?[index]?.name}"),
                trailing: Text("${widget.kurv?[index]?.price} kr."),
                /*leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/person.png'),

                   */
              ),
            );
          }),
    );
  }


  @override

  bool get wantKeepAlive => true;
}
