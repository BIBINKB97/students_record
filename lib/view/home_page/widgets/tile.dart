import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final String name;
  final String domain;
  final String batch;

  const ListTiles({
    super.key,
    required this.name,
    required this.domain,
    required this.batch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/user.png'),
        ),
        title: Text(name),
        subtitle: Text(domain),
        trailing: Text(batch),
      ),
    );
  }
}
