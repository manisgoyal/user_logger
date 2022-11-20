import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:user_logger/components/gender_selector.dart';

import '../models/models.dart';

class UserTile extends StatelessWidget {
  final User user;
  UserTile({Key? key, required this.user}) : super(key: key);
  Box<LoggedUser> loggedUser = Hive.box<LoggedUser>('loggedUser');

  void addUser(BuildContext context) {
    LoggedUser toAdd = LoggedUser();
    toAdd.setUid = user.getId;
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        GenderSelector genSelector = GenderSelector();
        TextEditingController ageController = TextEditingController();
        return AlertDialog(
          title: const Text("Enter your Details"),
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: ageController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your Age",
                  ),
                  keyboardType: TextInputType.number,
                ),
                genSelector
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  if (ageController.text.isNotEmpty) {
                    toAdd.setAge = int.parse(ageController.text);
                    toAdd.setGender = genSelector.getGenValue;
                    toAdd.setName = user.getName;
                    loggedUser.put(0, toAdd);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        customSnackbar("User Info has been added."));
                    Navigator.pushReplacementNamed(context, '/userLogged');
                    Navigator.pushNamed(context, "/userInfo");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        customSnackbar("Please Enter the Details."));
                  }
                },
                child: const Text("SUBMIT")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("CANCEL"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (loggedUser.isEmpty)
          ? () => addUser(context)
          : (loggedUser.get(0)?.getUid == user.getId)
              ? () {
                  Navigator.pushNamed(context, "/userInfo");
                }
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackbar("Please, logout the current user."));
                },
      child: Card(
        shadowColor: const Color.fromARGB(255, 219, 219, 218),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.getName,
                style: const TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: (loggedUser.get(0)?.getUid != user.getId)
                    ? const Icon(
                        Icons.login_sharp,
                        size: 30,
                      )
                    : const Icon(
                        Icons.logout_sharp,
                        size: 30,
                      ),
                onPressed: (loggedUser.isEmpty)
                    ? () => addUser(context)
                    : (loggedUser.get(0)?.getUid == user.getId)
                        ? () {
                            loggedUser.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackbar("User has been logged out"));
                            Navigator.popAndPushNamed(context, '/userLogged');
                          }
                        : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

SnackBar customSnackbar(String msg) {
  return SnackBar(
    content: Text(msg),
    backgroundColor: const Color.fromARGB(185, 182, 180, 180),
    duration: const Duration(milliseconds: 2000),
    behavior: SnackBarBehavior.floating,
  );
}
