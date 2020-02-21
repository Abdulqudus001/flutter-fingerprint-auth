//import 'dart:math';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

var _database;

void main() async {
  _database = openDatabase(
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
  final String username;
  final String email;
  final String password;

  User({this.username, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
//      'id': Uuid().v1(),
      'username': username,
      'email': email,
      'password': password
    };
  }

  void openDB() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), 'user_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE user(id text, username text, email text, password text)'
          );
        },
        version: 1
    );
  }

  Future<void> addUser(User user) async {
    final Database db = await _database;
    await db.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
    print('Saved');
  }

  Future<User> getUser(String username) async {
    final Database db = await _database;
    List<Map> results = await db.query("user",
        columns: ["id", "username", "email"],
        where: 'username = ?',
        whereArgs: [username]);

    var user = results.first;

    if (results.length > 0) {
      return User(
        username: user['username'],
        email: user['email'],
        password: user['password']
      );
    }
    return null;
  }

}