class User_Model
{
  late String name;
  late String email;
  late String phone;
  late String uId;
  late bool isEmailVrified;

  User_Model({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVrified,
});

  User_Model.fromJson(Map<String,dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVrified = json['isEmailVrified'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'isEmailVrified':isEmailVrified
    };
  }

}