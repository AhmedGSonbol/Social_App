class User_Model
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVrified;
  String? image;
  String? cover;
  String? bio;
  String? FCM_token;

  User_Model({
    this.name,
    this.phone,
    this.image,
    this.cover,
    this.email,
    this.uId,
    this.isEmailVrified,
    this.bio,
    this.FCM_token

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
    FCM_token = json['FCM_token'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      if(name != null)
        'name':name,

      if(email != null)
        'email':email,

      if(phone != null)
        'phone':phone,

      if(uId != null)
        'uId':uId,

      if(isEmailVrified != null)
        'isEmailVrified':isEmailVrified,

      if(image != null)
        'image':image,

      if(cover != null)
        'cover':cover,

      if(bio != null)
        'bio':bio,

      if(FCM_token != null)
        'FCM_token':FCM_token
    };
  }

}