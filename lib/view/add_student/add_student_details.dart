import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/widgets/textform_field.dart';

class AddStudentDetails extends StatelessWidget {
  const AddStudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Details'),
        backgroundColor: ktheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight80,
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/user.png'),
                radius: 80,
              ),
            ),
            kheight30,
            TextForm(
              hintTxt: 'name',
            ),
            TextForm(
              hintTxt: 'age',
            ),
            TextForm(
              hintTxt: 'domain',
            ),
            TextForm(
              hintTxt: 'batch',
            ),
            TextButton(onPressed: () {}, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
