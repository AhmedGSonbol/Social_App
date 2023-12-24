class Post_Model
{
  String? name;
  String? uId;
  String? image;
  String? datetime;
  String? text;
  String? postImage;



  Post_Model({
    this.name,
    this.image,
    this.uId,
    this.datetime,
    this.text,
    this.postImage,
  });

  Post_Model.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    datetime = json['datetime'];
    text = json['text'];
    postImage = json['postImage'];

  }

  Map<String,dynamic> toMap()
  {
    return{
      if(name != null)
        'name':name,

      if(uId != null)
        'uId':uId,

      if(image != null)
        'image':image,

      if(text != null)
        'text':text,

      if(datetime != null)
        'datetime':datetime,

      if(postImage != null)
        'postImage':postImage,

    };
  }

}