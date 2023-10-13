import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/add_student_details.dart';
import 'package:student_records/view/home_page/widgets/drawer.dart';
import 'package:student_records/view/home_page/widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
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
      drawer: CustomDrawer(),
      body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext context, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final data = studentList[index];
                return StudentTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'delete !',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: Text(
                            'This action will clear all the data in this application !',
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
                              child: Text('delete'),
                              onPressed: () {
                                if (data.id != null) {
                                  deleteData(data.id!);
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  image: 'images/user.png',
                  batch: data.batch,
                  domain: data.domain,
                  name: data.name,
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
