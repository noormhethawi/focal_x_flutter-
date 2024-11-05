import 'dart:convert';

class user {
  String email;
  String password;
  String name;
  user({
    required this.email,
    required this.password,
    required this.name,
  });
  // static user fromjson(DocumentSnapshot snap) {
  //   var snapsht = snap.data() as Map<String, dynamic>;
  // }

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'password': password};
}
