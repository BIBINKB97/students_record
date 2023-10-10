import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/view/add_student/add_student_details.dart';
import 'package:student_records/view/home_page/widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Students'),
        backgroundColor: ktheme,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTiles(),
          ListTiles(),
          ListTiles(),
          ListTiles(),
          ListTiles(),
          ListTiles(),
          ListTiles(),
          ListTiles(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddStudentDetails()));
        },
        child: Icon(Icons.add),
        backgroundColor: ktheme,
      ),
    );
  }
}
