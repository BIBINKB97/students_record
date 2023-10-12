import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  final String name;
  final String domain;
  final String batch;
  final Function()? onTap;
  final String image;

  const StudentTile({
    super.key,
    required this.name,
    required this.domain,
    required this.batch,
    this.onTap, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(image),
      ),
      title: Text(name),
      subtitle: Text(domain),
      trailing: Text(batch),
    );
  }
}
