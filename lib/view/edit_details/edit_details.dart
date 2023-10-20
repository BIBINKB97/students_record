// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final tempImage = File(image.path);
    setState(() => this.image = tempImage);
    Navigator.pop(context);
  }

  Future gallery() async {
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
                backgroundImage: image == null
                    ? FileImage(File(widget.model.image))
                    : FileImage(File(image!.path)),
                radius: 80,
              ),
            ),
            kheight20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ktheme,
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.camera_alt_sharp,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  Text(
                    'Edit Image',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
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
                                      borderRadius: BorderRadius.circular(15)),
                                  minimumSize: Size(150, 50)),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.black,
                                    size: 24.0,
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
                                      borderRadius: BorderRadius.circular(15)),
                                  minimumSize: Size(150, 50)),
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
                              onPressed: () => gallery(),
                            )
                          ],
                        ));
                  },
                );
              },
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
      image: image == null ? widget.model.image : image!.path,
    );
    updateData(student);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Center(child: Text('Data Updated Successfully !')),
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }
}
