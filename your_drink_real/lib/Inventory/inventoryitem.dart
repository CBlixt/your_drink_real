class InventoryItem {
  String name = 'item';
  int number = 0;
  double price = 10;
  String flag = 'test';

  InventoryItem({required this.name,required this.number,required this.price,required this.flag});

  //method that assign values to respective datatype vairables
  InventoryItem.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    number = json['number'];
    price = json['price'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "number": this.number,
      "price": this.price,
      "flag": this.flag
    };
  }



}