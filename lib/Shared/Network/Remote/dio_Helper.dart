import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://fcm.googleapis.com/fcm/send',
            receiveDataWhenStatusError: true,
            headers:
            {
              'Content-Type': 'application/json',
              'Authorization': 'key=AAAA979ncVI:APA91bECbLjj04oY5xIPwMQnk0dflXaFu0kn0bLKmuFYX6A93rrjOKD2xAT71RMkwI7XsMeEJXpCjTVuB9QMrGRjNWA6nvu8P1jrxgq6EuRt7y_Q9St44_okcXMFw3hfjpxSaahYv4wr',
            }
        )
    );
  }

  static Future<Response>? post({
    required Map<String, dynamic> data,
  }) async
  {
    print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
    print(data);
    return await dio.post(
      '',
      data: data
    );
  }

  static Map<String, dynamic> FCM_Data({
    required String fcmToken,
    String? title,
    String? body,
    required Map<String, String> data
  })
  {
    return {
      "to": fcmToken,
      "notification":
      {
        "title": title??"title here !",
        "body": body??"Rich Notification testing (body)",
        "mutable_content": true,
        "sound": "Tri-tone"
      },

      // data != null ? :
      "data": data
    };
  }

}