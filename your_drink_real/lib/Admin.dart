class Admin {
  //data Type
  String name = 'Admin';
  int code = 0;

// constructor
  Admin({
    required this.name,
    required this.code,
  });

  //method that assign values to respective datatype vairables
  Admin.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
    };
  }
}
