import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:pro/core/const_data/const_data.dart';

class NotificationController extends GetxController {
  bool isLoading = false;
  var notificationsList = <String>[].obs;
  RxInt number = 0.obs;

  @override
  void onInit() async {
    // await getAccessToken();
    // receiveNotification();
    // handleNotificationOpened();
    super.onInit();
  }

  //get Access Token
  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
        'assets/notification-task-c9311-firebase-adminsdk-irrts-2eb8368416.json',
      );
      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );
      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );
        ConstData.accessToken = accessCredentials.accessToken.data;
      } catch (e) {
        print('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Error loading service account JSON: $e');
    }
  }

  Future<void> sendNotification() async {
    isLoading = true;
    number++;
    update();
    var headers = {
      "Authorization": "Bearer ${ConstData.accessToken}",
      "Content_type": "Application"
    };
    var uri = "";
    var body = {
      "message": {
        "token": ConstData.fcmToken,
        "notification": {
          "body": "This is a notification message!",
          "title": "$number FCM Message"
        }
      }
    };
    var request = http.Request("Post", Uri.parse(uri));
    request.headers.addAll(headers);
    request.body = json.encode(body);
    var response = await request.send();
    final resBody = await response.stream.bytesToString();
    print("Response Body of send notification function is => $resBody");
    isLoading = false;
    update();
  }

  void receiveNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      notificationsList.insert(
          0, '${message.notification!.title}: ${message.notification!.body}');

      Get.snackbar(
        message.notification!.title ?? 'Notification',
        message.notification!.body ?? '',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
      );

      update();
    });
  }

  /*if you click on receive notification button and you go
  to background status, if you click on the notification
  you receive, the notification will appear on notification
  page and a snack bar for it will appear */
  void handleNotificationOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        notificationsList.insert(
            0, '${message.notification!.title}: ${message.notification!.body}');
        Get.snackbar(
          message.notification!.title ?? 'Notification',
          message.notification!.body ?? '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.black,
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
        );
      }
    });
  }
}
