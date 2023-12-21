class User_Model
{
  late String name;
  late String email;
  late String phone;
  late String uId;
  late bool isEmailVrified;
  late String image;
  late String cover;
  late String bio;

  User_Model({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVrified,
    required this.image,
    required this.cover,
    required this.bio
});

  User_Model.fromJson(Map<String,dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVrified = json['isEmailVrified'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'isEmailVrified':isEmailVrified,
      'image':image,
      'cover':cover,
      'bio':bio
    };
  }

}