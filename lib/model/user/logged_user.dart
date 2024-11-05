
class loggeduser {
  String email;
  String password;
  
  loggeduser({
    required this.email,
    required this.password,
  
  });
  // static user fromjson(DocumentSnapshot snap) {
  //   var snapsht = snap.data() as Map<String, dynamic>;
  // }

  Map<String, dynamic> toJson() =>
      { 'email': email, 'password': password};
}
