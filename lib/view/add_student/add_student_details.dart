import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/widgets/textform_field.dart';
import 'package:student_records/view/home_page/homepage.dart';

class AddStudentDetails extends StatelessWidget {
  AddStudentDetails({super.key});
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _domainController = TextEditingController();
  final _batchController = TextEditingController();

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
              keyboardtype: TextInputType.text,
              controller: _nameController,
              hintTxt: 'name',
            ),
            TextForm(
              maxLength: 2,
              keyboardtype: TextInputType.number,
              controller: _ageController,
              hintTxt: 'age',
            ),
            TextForm(
              keyboardtype: TextInputType.text,
              controller: _domainController,
              hintTxt: 'domain',
            ),
            TextForm(
              keyboardtype: TextInputType.text,
              controller: _batchController,
              hintTxt: 'batch',
            ),
            TextButton(
              onPressed: () {
                onAddButton();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddButton() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final domain = _domainController.text.trim();
    final batch = _batchController.text.trim();
    if (name.isEmpty || age.isEmpty || domain.isEmpty || batch.isEmpty) {
      return;
    }
    final student = StudentModel(
      name: name,
      age: age,
      domain: domain,
      batch: batch,
    );
    addStudent(student);
  }
}
