import 'dart:convert';
import 'package:http/http.dart' as http;



Future<void> sendPushNotification(
    String userToken, String title, String body) async {
  String serverKey =
      'ya29.a0AXooCgulcjhnaGVP7jT9CH-TjbaEHgcvxLGpndvhtga8cVr8npE-XL5Vjz8P5t88CGsgrkdLnhOh3JNutZ_EvORF4ILalTzBaDd4P-szBNp3C74ML5Svz8cs_AZtbVVOaAWTBgVJD9VdtO5fBXAGGzcosWjWwAgjj1l7aCgYKAcQSARESFQHGX2Mi2cD9BZ0u1K3nDEsITJXtaQ0171';

  String fcmUrl = 'https://fcm.googleapis.com/v1/projects/healthbubba-1d206/messages:send';


 Map<String, dynamic> notification =  {
  "message":{
    "token":userToken,
    "notification":{
      "title":title,
      "body":body
    }
  }
};

  String jsonBody = json.encode(notification);

  try {
    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      print('Push notification sent successfully');
    } else {
      print('Failed to send push notification: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending push notification: $e');
  }
}

Future<void> sendTopicNotification(
    String topic, String title, String body) async {

  String serverKey =
      'AAAAHXOa4oA:APA91bG3PcQwkNGCATsoKDoXjvROAGN2NSHcfIU6c4dcMqWRz93ThsBzUB9GmCsj77PakBLHcDQ_UQQTMluQYxb_DjufHO1wkKXXriAYX6wnmHPxaBQ9kQ3nYXIIH7bogx7NlDMuByNk';

  String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  Map<String, dynamic> notification = {
    'notification': {'title': title, 'body': body},
    'to': '/topics/$topic',  
  };

  String jsonBody = jsonEncode(notification);

  try {
    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      print('Push notification sent to topic "$topic" successfully');
    } else {
      print(
          'Failed to send push notification to topic "$topic": ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error sending push notification: $e');
  }
}