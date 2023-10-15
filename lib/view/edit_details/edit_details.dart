// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/widgets/textform_field.dart';
import 'package:student_records/view/home_page/homepage.dart';

class EditDetails extends StatefulWidget {
  StudentModel model;

  EditDetails({
    super.key,
    required this.model,
  });

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _domainController = TextEditingController();
  final _batchController = TextEditingController();
  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  @override
  void initState() {
    widget._nameController.text = widget.model.name;
    widget._ageController.text = widget.model.age;
    widget._batchController.text = widget.model.batch;
    widget._domainController.text = widget.model.domain;
    super.initState();
  }

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
              keyboardtype: TextInputType.text,
              controller: widget._nameController,
              hintTxt: 'name',
            ),
            TextForm(
              keyboardtype: TextInputType.number,
              maxLength: 2,
              controller: widget._ageController,
              hintTxt: 'age',
            ),
            TextForm(
              keyboardtype: TextInputType.text,
              controller: widget._domainController,
              hintTxt: 'domain',
            ),
            TextForm(
              keyboardtype: TextInputType.text,
              controller: widget._batchController,
              hintTxt: 'batch',
            ),
            TextButton(
              onPressed: () {
                onUpdateButton();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onUpdateButton() async {
    final name = widget._nameController.text.trim();
    final age = widget._ageController.text.trim();
    final domain = widget._domainController.text.trim();
    final batch = widget._batchController.text.trim();
    if (name.isEmpty || age.isEmpty || domain.isEmpty || batch.isEmpty) {
      return;
    }
    final student = StudentModel(
      id: widget.model.id,
      name: name,
      age: age,
      domain: domain,
      batch: batch,
    );
    updateData(student);
  }
}
