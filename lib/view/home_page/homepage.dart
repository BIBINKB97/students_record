// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/view/add_student/add_student_details.dart';
import 'package:student_records/view/home_page/widgets/search.dart';
import 'package:student_records/view/home_page/widgets/tile.dart';
import 'package:student_records/view/view_details/view_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomSearchBar(),
      ),
      body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext context, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final data = studentList[index];
                return StudentTile(
                  image: data.image == null
                      ? AssetImage('images/user.png')
                      : FileImage(File(data.image)) as ImageProvider,
                  batch: data.batch,
                  domain: data.domain,
                  name: data.name,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewDetails(
                              image: data.image,
                              id: data.id,
                              name: data.name,
                              age: data.age,
                              batch: data.batch,
                              domain: data.domain,
                            )));
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'delete !',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: Text(
                            'Are you sure ? \nyou want to delete this file ?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                deleteData(data.id!);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: studentList.length,
            );
          }),
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
