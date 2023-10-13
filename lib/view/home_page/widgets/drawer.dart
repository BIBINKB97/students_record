import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/view/home_page/homepage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        Center(
            child: ListTile(
                leading: Icon(Icons.delete_forever),
                title: Text(
                  'delete all files',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'delete !',
                          style: TextStyle(color: Colors.red),
                        ),
                        content: const Text(
                          'This action will clear all the data in this application !',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              deleteAlldata();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                })),
      ])),
    );
  }
}
