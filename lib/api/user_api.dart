import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user.dart';

class UserApi {
  static Future<List<User>> getUserList() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final respString = await _loadAsset('assets/sample/sample_userInfo.json');
    final List<dynamic> userjson = jsonDecode(respString);
    final users = <User>[];
    if (userjson[0]["users"] != null) {
      userjson[0]["users"].forEach((v) {
        users.add(User.fromJson(v));
      });
    }
    return users;
  }

  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
