//import 'dart:math';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  String username;
  String email;
  String password;

  User(String username, String email, String password) {
    this.username = username;
    this.email = email;
    this.password = password;
    openDB();
  }

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
        join(await getDatabasesPath(), 'users_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE users(id text, username text NOT NULL UNIQUE, email text NOT NULL UNIQUE, password text NOT NULL)'
          );
        },
        version: 1
    );
  }

  Future<void> delete() async {
    final Database db = await _database;
    await db.delete('users', where: 'username = ?', whereArgs: ['abdulqudus001']);
    print('Saved');
  }

  Future<void> dropTable() async {
      await deleteDatabase(join(await getDatabasesPath(), 'users_database.db'));
  }

  Future<void> addUser(User user) async {
    final Database db = await _database;
    await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.fail);
    print('Saved');
  }
}

Future<User> getUser(String username) async {
  final Database db = await _database;
  List<Map> results = await db.query("users",
      columns: ["username", "email", "password"],
      where: 'username = ?',
      whereArgs: [username]);

  var user = results.first;
  if (results.length > 0) {
    return User(user['username'], user['email'], user['password']);
  }
  return null;
}