class ProductDataModel{
  //data Type
  int? id;
  String? name;
  String? debt;
  String? imageURL;
  String? husnummer;

  //TODO: Use image path and not URL
  //TODO: Save to json file

// constructor
  ProductDataModel(
      {
        this.id,
        this.name,
        this.imageURL,
        this.husnummer,
        this.debt,
      }
      );

  //method that assign values to respective datatype vairables
  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    husnummer = json['husnummer'];
    imageURL = json['imageUrl'];
    debt = json['debt'];
  }
}