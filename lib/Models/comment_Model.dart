class Comment_Model
{
  String? commentId ;
  String? uId ;
  String? userName ;
  String? userImage ;
  String? datetime ;
  String? commentText;
  bool? isMyComment;

  Comment_Model({
    required this.uId,
    required this.datetime,
    required this.commentText
  });

  Comment_Model.fromJson(Map<String,dynamic> json)
  {
    commentId = json['commentId'];
    uId = json['uId'];
    userName = json['userName'];
    userImage = json['userImage'];
    datetime = json['datetime'];
    commentText = json['commentText'];
    isMyComment = json['isMyComment'];
  }

  Map<String,dynamic> toMap()
  {
    return {

      if(commentId != null)
          'commentId': commentId,

      if(uId != null)
        'uId': uId,

      if(userName != null)
        'userName': userName,

      if(userImage != null)
        'userImage': userImage,

      if(commentText != null)
        'commentText': commentText,

      if(datetime != null)
        'datetime': datetime,

      if(isMyComment != null)
        'isMyComment': isMyComment,
    };
  }
}