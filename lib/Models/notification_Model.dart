class Notification_Model
{
  late String user_FCM_Token;
  late String type;
  late String value;
  late String title;
  late String body;

  Notification_Model({
    required this.user_FCM_Token,
    required this.type,
    required this.value,
    required this.title,
    required this.body
});

  Notification_Model.fromJson(Map<String,dynamic> json)
  {
    type = json['type'];
    value = json['value'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        "to": user_FCM_Token,
        "android":{
          "priority":"HIGH"

        },
        "notification": {
          "title": title,
          "body": body,
          "mutable_content": true,
          "sound": "default",
          "default_light_setting":true,
          "default_vibrate_timing":true,
          "notification_priority":"PRIORITY_MAX"
        },

        "data": {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          // "url": "<url of media image>",
          // "dl": "<deeplink action on tap of notification>",
          "type":type,
          "value": value
        }
      };
  }
}