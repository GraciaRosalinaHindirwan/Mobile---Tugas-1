import 'package:hive_flutter/hive_flutter.dart';

class User {
  String name;
  final String username;
  final String email;
  String password;

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });
}

class AuthService {
  static const String boxName = 'users';

  static Future<Box> get _box async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }

    return Hive.box(boxName);
  }

  static Future<bool> register(
    String name,
    String username,
    String email,
    String password,
  ) async {
    final box = await _box;

    // Username sudah digunakan
    if (box.containsKey(username)) {
      return false;
    }

    await box.put(username, {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    return true;
  }

  static Future<bool> login(
    String username,
    String password,
  ) async {
    final box = await _box;

    final data = box.get(username);

    if (data == null) {
      return false;
    }

    if (data['password'] != password) {
      return false;
    }

    await box.put('loggedInUsername', username);

    return true;
  }

  static Future<bool> changeName(String newName) async {
    final box = await _box;

    // Di sini kita perlu tahu user yang sedang login
    final username = box.get('loggedInUsername');

    if (username == null) {
      return false;
    }

    final user = box.get(username);

    if (user == null) {
      return false;
    }

    user['name'] = newName;

    await box.put(username, user);

    return true;
  }

  static Future<User?> getLoggedUser() async {
    final box = await _box;

    final username = box.get('loggedInUsername');

    if (username == null) {
      return null;
    }

    final data = box.get(username);

    if (data == null) {
      return null;
    }

    return User(
      name: data['name'],
      username: data['username'],
      email: data['email'],
      password: data['password'],
    );
  }

  static Future<bool> changePassword(String newPassword) async {
    final box = await _box;

    final username = box.get('loggedInUsername');

    if (username == null) {
      return false;
    }

    final user = box.get(username);

    if (user == null) {
      return false;
    }

    user['password'] = newPassword;

    await box.put(username, user);

    return true;
  }

  static Future<bool> deleteAccount() async {
    final box = await _box;

    // Ambil username yang sedang login
    final username = box.get('loggedInUsername');

    if (username == null) {
      return false;
    }

    // Hapus data user
    await box.delete(username);

    // Hapus status login
    await box.delete('loggedInUsername');

    return true;
  }

  static Future<bool> logout() async {
    final box = await _box;

    // Ambil username yang sedang login
    final username = box.get('loggedInUsername');

    if (username == null) {
      return false;
    }

    // Hapus status login
    await box.delete('loggedInUsername');

    return true;
  }
}