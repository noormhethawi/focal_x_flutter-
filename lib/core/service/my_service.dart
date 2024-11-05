import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pro/core/const_data/const_data.dart';
import 'package:pro/model/fcm.dart';

class MyService extends GetxService {
  //late GetStorage storage;
  RxBool isLogin = false.obs;
  final storage = GetStorage();

  Future<MyService> init() async {
    await GetStorage.init(); // Initialize GetStorage
    // storage = GetStorage(); // Create an instance of GetStorage

    // Initialize isLogin from storage
    isLogin.value = storage.read('islogin') ?? false;

    // Listen for changes to isLogin and update storage
    ever(isLogin, (value) {
      storage.write('islogin', value);
    });

    return this;
  }

  // Example methods to read and write from GetStorage
  void saveData(String key, dynamic value) {
    storage.write(key, value);
  }

  dynamic readData(String key) {
    return storage.read(key);
  }

  //  Future<MyService> initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //   return this;
  // }

  RxList<String> fcmTokens = <String>[].obs;

  Future<void> fetchFCMTokens() async {
    final response = await http.get(
      Uri.parse('https://task.focal-x.com/api/fcm'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'][0];
      ConstData.FCM = FcmToken.fromJson(data).fcmToken;
      print(ConstData.FCM);
      // List<String> tokens = data
      //     .map<String>((tokenData) => tokenData['fcm_token'].toString())
      //     .toList();

      // fcmTokens.assignAll(tokens);
    } else {
      throw Exception('Failed to load FCM tokens');
    }
  }
}

initialService() async {
  await Get.putAsync(() => MyService().init());
}

bool isLoggedIn() {
  final box = GetStorage();
  print(box.read('islogin'));
  return box.read('islogin') ?? false;
}
