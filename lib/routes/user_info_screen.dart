import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:user_logger/components/gender_item.dart';

import '../models/models.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoggedUser? loggedUser = Hive.box<LoggedUser>('loggedUser').get(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Name:",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                ),
                Text(
                  loggedUser!.getName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 70),
                ),
                const Text(
                  "Age:",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                ),
                Text(
                  loggedUser.getAge.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 70),
                ),
                const Text(
                  "Gender:",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                ),
                GenderAvatar(gen: loggedUser.getGender ?? Gender.male),
              ]),
        ),
      ),
    );
  }
}
