import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/add_student/widgets/textform_field.dart';
import 'package:student_records/view/home_page/homepage.dart';

class AddStudentDetails extends StatefulWidget {
  const AddStudentDetails({super.key});

  @override
  State<AddStudentDetails> createState() => _AddStudentDetailsState();
}

class _AddStudentDetailsState extends State<AddStudentDetails> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _domainController = TextEditingController();

  final _batchController = TextEditingController();

  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final tempImage = File(image.path);
    setState(() => this.image = tempImage);
    Navigator.pop(context);
  }

  Future pickFromgallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final tempImage = File(image.path);
    setState(() => this.image = tempImage);
    Navigator.pop(context);
  }

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
                radius: 80,
                backgroundImage: image == null
                    ? AssetImage('images/user.png')
                    : FileImage(File(image!.path)) as ImageProvider,
              ),
            ),
            kheight10,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.black,
                  minimumSize: Size(150, 50)),
              child: Text(
                "Add photo",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(height: 48),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: Size(200, 50)),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.camera,
                                    size: 24.0,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () => pickImage(),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: Size(200, 50)),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.photo,
                                    size: 24.0,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Gallery',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () => pickFromgallery(),
                            ),
                          ],
                        ));
                  },
                );
              },
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
