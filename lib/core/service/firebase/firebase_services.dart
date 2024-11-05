// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:tt/core/const_data/const_data.dart';


// class FirebaseServices {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   //get fcm token from users table in firebase database
//   Future<void> fetchUserFCMToken() async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .where('uid', isEqualTo: _auth.currentUser!.uid)
//           .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         ConstData.fcmToken = querySnapshot.docs.first.get('fcmToken') ?? '';
//       } else {
//         print('User not found in users collection');
//       }
//     } catch (e) {
//       print('Error fetching FCM Token: $e');
//     }
//   }

//   //sign in with firebase /email & password/ process
//   Future<String> signInUser({
//     required String email,
//     required String password,
//   }) async {
//     String res = "Some errors occurred";
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (userCredential.user != null) {
//         String userId = userCredential.user!.uid;
//         ConstData.fcmToken = (await FirebaseMessaging.instance.getToken())!;
//         await FirebaseFirestore.instance.collection('users').doc(userId).set({
//           'uid': userId,
//           'fcmToken': ConstData.fcmToken,
//         });
//         res = "Success";
//       } else {
//         res = "User is null";
//       }
//     } catch (err) {
//       return err.toString();
//     }
//     return res;
//   }
// }
