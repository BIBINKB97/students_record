import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/add_student_details.dart';
import 'package:student_records/view/home_page/widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Students'),
        backgroundColor: ktheme,
        elevation: 0,
        actions: const [
          Icon(Icons.search),
          kwidth20,
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTiles();
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddStudentDetails()));
        },
        backgroundColor: ktheme,
        child: Icon(Icons.add),
      ),
    );
  }
}
