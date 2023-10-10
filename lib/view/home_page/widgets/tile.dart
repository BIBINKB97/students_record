import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/user.png'),
        ),
        title: Text('name'),
        subtitle: Text('domain'),
        trailing: Text('BATCH'),
      ),
    );
  }
}
