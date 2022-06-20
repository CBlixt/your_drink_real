import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';
import '../Bruger.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:your_drink_real/brugerList.dart';

import '../FileManager.dart';
bool vis = false;
class MyStartPage extends StatefulWidget {
  const MyStartPage({Key? key, this.user, required this.index}) : super(key: key);
  final int index;
  final Bruger? user;

  @override
  State<MyStartPage> createState() => _MyStartPageState();
}

class _MyStartPageState extends State<MyStartPage> {
  double number =0;
  String? pressName;

  Color presColor = Colors.lightGreenAccent;
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold )),
          SizedBox(height: 100,),
          Visibility(visible:vis,
            child: Center(
              child: Row(children: [
                IconButton(onPressed: (){
                  setState((){vis=!vis;
                    var index =InventoryFileManager.getData().indexWhere((element) => element.name==pressName);
                  InventoryItem updateItem =InventoryFileManager.getData()[index];
                  updateItem.number-=number.round();
                  InventoryFileManager.updateInventoryItem(updateItem, index);
                  InventoryFileManager.updateInventoryCount();

                  var newDebt = FileManager.getData()[widget.index].debt+(updateItem.price*number.round());
                  FileManager.saveDebt(newDebt, widget.index);

                  });
                }, icon: Icon(Icons.check)),
                Text("${number.round()}"),
                IconButton(onPressed: (){setState((){vis=!vis;});}, icon: Icon(Icons.clear))
              ],),
            ),
          ),
          Visibility(visible: vis,
            child: Slider( onChanged: (newNumber){
              setState((){number =newNumber;
              });
            },min: 0,max: 4, value: number,),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag1}"),
                  onPressed: () async {

                    if(FileManager.getData()[widget.index].flag1=="Add drink"){
                      var flag =  await Navigator.pushNamed(context, '/shopdrink');
                      setState((){
                        FileManager.saveDrink(flag.toString(), FileManager.getData()[widget.index].flag2, FileManager.getData()[widget.index].flag3, widget.index);
                      });

                    }
                    else{
                      setState((){
                        if(!vis) {
                          vis = !vis;

                        } else if(vis&&pressName == FileManager.getData()[widget.index].flag1){
                          vis=!vis;
                        }
                        pressName = FileManager.getData()[widget.index].flag1;
                      });
                    }


                  },onLongPress: () async {
                  var flag =  await Navigator.pushNamed(context, '/shopdrink');
                  setState((){
                    FileManager.saveDrink(flag.toString(), FileManager.getData()[widget.index].flag2, FileManager.getData()[widget.index].flag3, widget.index);
                  });
                },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag2}"),
                  onPressed: () async {

                    if(FileManager.getData()[widget.index].flag2=="Add drink"){
                      var flag =  await Navigator.pushNamed(context, '/shopdrink');
                      setState((){
                        FileManager.saveDrink( FileManager.getData()[widget.index].flag1,flag.toString(), FileManager.getData()[widget.index].flag3, widget.index);
                      });
                    }
                    else{
                      setState((){
                        if(!vis) {
                          vis = !vis;
                        } else if(vis&&pressName == FileManager.getData()[widget.index].flag2){
                          vis=!vis;
                        }
                        pressName = FileManager.getData()[widget.index].flag2;
                      });
                    }


                  },
                  onLongPress: () async {
                    var flag =  await Navigator.pushNamed(context, '/shopdrink');
                    setState((){
                      FileManager.saveDrink( FileManager.getData()[widget.index].flag1,flag.toString(), FileManager.getData()[widget.index].flag3, widget.index);
                    });
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag3}"),
                  onPressed: () async {

                    if(FileManager.getData()[widget.index].flag3=="Add drink"){
                      var flag =  await Navigator.pushNamed(context, '/shopdrink');
                      setState((){
                        FileManager.saveDrink(FileManager.getData()[widget.index].flag1, FileManager.getData()[widget.index].flag2,flag.toString(), widget.index);
                      });
                    }
                    else{
                      setState((){
                        if(!vis) {
                          vis = !vis;

                        } else if(vis&&pressName == FileManager.getData()[widget.index].flag3){
                          vis=!vis;
                        }
                        pressName = FileManager.getData()[widget.index].flag3;
                      });
                    }
                  },onLongPress: () async {
                  var flag =  await Navigator.pushNamed(context, '/shopdrink');
                  setState((){
                    FileManager.saveDrink(FileManager.getData()[widget.index].flag1, FileManager.getData()[widget.index].flag2,flag.toString(), widget.index);
                  });
                },
                ),
              )
            ],
          )

        ],

        ),
      ),
    );
  }
}