// database table and column names
// const String tableWords = 'words';
// const String columnId = '_id';
// const String columnWord = 'word';
// const String columnFrequency = 'frequency';

import 'package:flutter/cupertino.dart';

class User {
  User({this.id, @required this.username, @required this.password});
  // User(this._username, this._password);
  //
  User.fromMap(dynamic obj){
    username = obj['username'].toString();
    password = obj['password'].toString();
  }

  int id;
  String username;
  String password;

  // String get username => username;
  // String get password => password;

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }

  // Map<String, dynamic> toMap(){
  //   return <String, dynamic>{
  //     'id' : id,
  //     'username' : username,
  //     'password' : password,
  //   };
  // }

  @override
  String toString() {
    return 'User=(id: $id, username: $username, password: $password)';
  }
}