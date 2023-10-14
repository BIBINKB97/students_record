import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/widgets/textform_field.dart';
import 'package:student_records/view/home_page/homepage.dart';

class EditDetails extends StatelessWidget {
  final String name;
  final String age;
  final String domain;
  final String batch;
  final int? id;
  EditDetails({
    super.key,
    this.id,
    required this.name,
    required this.age,
    required this.domain,
    required this.batch,
  });
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _domainController = TextEditingController();
  final _batchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
        centerTitle: true,
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
              controller: _nameController,
              hintTxt: 'name',
            ),
            TextForm(
              controller: _ageController,
              hintTxt: 'age',
            ),
            TextForm(
              controller: _domainController,
              hintTxt: 'domain',
            ),
            TextForm(
              controller: _batchController,
              hintTxt: 'batch',
            ),
            TextButton(
              onPressed: () {
                onAddButton();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
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
