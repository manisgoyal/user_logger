import 'package:flutter/material.dart';

import '../api/user_api.dart';
import '../components/user_listview.dart';

class UserLogScreen extends StatelessWidget {
  const UserLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Logger"),
      ),
      body: FutureBuilder(
          future: UserApi.getUserList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return const CircularProgressIndicator(
                strokeWidth: 10,
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return UserListView(userLists: snapshot.data ?? []);
            }
            return const Scaffold();
          }),
    );
  }
}
