import 'package:flutter/material.dart';
import 'package:your_drink_real/Inventory/inventoryitem.dart';
import 'package:your_drink_real/InventoryFileManager.dart';
import '../Bruger.dart';
import 'package:flutter/src/widgets/page_view.dart';

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
  double number =1;
  String? pressName;

  Color presColor = Colors.lightGreenAccent;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
backgroundColor: Colors.green[100],
      body: Container(
        child: Column(children: <Widget> [
          SizedBox(height: 50),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                text: "Hej ${FileManager.getData()[widget.index].name}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,color: Colors.green[900] )
              )
               ]

            ),
          ),
           SizedBox(height: 40),
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: "Din gæld er: ",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.green[900])
                  ),
                  TextSpan(
                    text: "${FileManager.getData()[widget.index].debt}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange )
                  ),
                  TextSpan(
                    text: " kr.",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.green[900] )
                  )
                ]

            ),
          ),

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

                  var newDebt = (updateItem.price*number.round());
                  FileManager.saveDebt(newDebt, widget.index);

                  });
                }, icon: Icon(Icons.check)),
                Text("${number.round()}"),
                IconButton(onPressed: (){setState((){vis=!vis;});}, icon: Icon(Icons.clear))
              ],),
            ),
          ),
          Visibility(visible: vis,
            child: Slider(
              inactiveColor: Colors.green[900],
              activeColor: Colors.green[400],
              onChanged: (newNumber){
              setState((){number =newNumber;
              });
            },min: 1,max: 4, value: number,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag1}",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
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
                  color: Colors.green[50],
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag2}",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold),),
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
                  color: Colors.green[50],
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("${FileManager.getData()[widget.index].flag3}",style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold), ),
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
                  color: Colors.green[50],
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