import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pro/core/service/get_storage_key.dart';
import 'package:pro/core/service/my_service.dart';

class ConstData {
  final storage = GetStorage();

  static bool islogin = false;
  //static String token = "";
  static String? FCM = '';
  static const String map_key = "";
  static String? access_token = '';
  static String fcmToken = "";
  static String accessToken = "";

  
  static Future<void> updateToken() async {
    const String clientId = "";
    const String clientSecret = "";
    final response = await http.post(
      Uri.parse(''),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'grant_type': 'authorization',
        //   'client_id': clientId,
        // 'client_secret': clientSecret,
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      access_token = data['access_token'];
      islogin = true;
      print('Token updated: $access_token');
    } else {
      print('Failed to obtain access token:${response.statusCode}');
      print('Response body : ${response.body}');
    }
  }

  static Future<void> startTokenupdater() async {
    Timer.periodic(const Duration(seconds: 20), (timer) {
      updateToken();
    });
  }
}
