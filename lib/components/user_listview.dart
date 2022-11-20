import 'package:flutter/material.dart';
import 'package:user_logger/components/user_tile.dart';

import '../models/models.dart';

class UserListView extends StatelessWidget {
  final List<User> userLists;
  const UserListView({
    Key? key,
    required this.userLists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: userLists.length,
      itemBuilder: (context, index) => UserTile(user: userLists[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
