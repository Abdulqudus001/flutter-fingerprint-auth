import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)'
      );
    },
    version: 1
  );
}

class User {
  final int id;
  final String username;
  final String email;
  final String password;

  User({this.id, this.username, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password
    };
  }
}