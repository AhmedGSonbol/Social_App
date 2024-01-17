class Message_Model
{
  String? senderId;
  String? receiverId;
  String? datetime;
  String? text;




  Message_Model({
    this.senderId,
    this.receiverId,
    this.text,
    this.datetime,

  });

  Message_Model.fromJson(Map<String,dynamic> json)
  {
    senderId = json['senderId'];
    text = json['text'];
    receiverId = json['receiverId'];
    datetime = json['datetime'];


  }

  Map<String,dynamic> toMap()
  {
    return{
      if(senderId != null)
        'senderId':senderId,

      if(text != null)
        'text':text,

      if(receiverId != null)
        'receiverId':receiverId,

      if(datetime != null)
        'datetime':datetime,


    };
  }
}