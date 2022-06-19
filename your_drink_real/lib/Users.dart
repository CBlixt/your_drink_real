
class User{
  //data Type
  String? id;
  String? name;
  double? debt;
  String? imageURL;
  String? husnummer;

  //TODO: Save admin Code?
  //TODO: Use image path and not URL
  //TODO: addResident.dart only has a button to make a test user and needs to take inputs
  //TODO: Update users debt after transaction
  //TODO: Save user file after user makes a transaction


  //TODO: possibly make inventory also use json file

// constructor
  User(
      {
        required this.id,
        required this.name,
        required this.imageURL,
        required this.husnummer,
        required this.debt,
      }
      );

  //method that assign values to respective datatype vairables
  User.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    husnummer = json['husnummer'];
    imageURL = json['imageUrl'];
    debt = json['debt'];
  }


  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "husnummer": this.husnummer,
      "imageURL": this.imageURL,
      "debt": this.debt
    };
  }
}
