// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/add_student_details.dart';
import 'package:student_records/view/home_page/widgets/tile.dart';
import 'package:student_records/view/view_details/view_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.white,
    size: 35,
  );
  Widget customSearchBar = const Text(
    "All Students",
    style: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
  );
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customSearchBar,
        backgroundColor: ktheme,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = Icon(
                    Icons.cancel,
                    color: Colors.white,
                  );
                  customSearchBar = TextField(
                    onChanged: (value) {
                      search(value);
                    },
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Search',
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  );
                } else {
                  customIcon = Icon(
                    Icons.search,
                    size: 35,
                    color: Colors.white,
                  );
                  customSearchBar = Text(
                    "All Students",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  );
                }
              });
            },
            child: SizedBox(
              width: 100,
              child: customIcon,
            ),
          ),
        ],
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
