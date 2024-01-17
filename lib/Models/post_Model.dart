class Post_Model
{
  String? name;
  String? uId;
  String? image;
  String? datetime;
  String? text;
  String? postImage;
  String? postId;
  int? likes;
  bool? isLiked;
  int? commentsCount;



  Post_Model({
    this.name,
    this.image,
    this.uId,
    this.datetime,
    this.text,
    this.postImage,
    this.postId,
    this.likes,
    this.isLiked,
    this.commentsCount
  });

  Post_Model.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    datetime = json['datetime'];
    text = json['text'];
    postImage = json['postImage'];
    postId = json['postId'];

    likes = json['likes'];
    isLiked = json['isLiked'];
    commentsCount = json['commentsCount'];

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

      if(postId != null)
        'postId':postId,

      if(likes != null)
        'likes':likes,

      if(isLiked != null)
        'isLiked':isLiked,

      if(commentsCount != null)
        'commentsCount':commentsCount,

    };
  }
}