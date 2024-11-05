// models/fcm_token.dart
class FcmToken {
  final String fcmToken;

  FcmToken({required this.fcmToken});

  factory FcmToken.fromJson(Map<String, dynamic> json) {
    return FcmToken(fcmToken: json['fcm_token']);
  }
}
