// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_records/model/student_model.dart';
import 'package:student_records/utils/colors.dart';
import 'package:student_records/utils/constants.dart';
import 'package:student_records/view/edit_details/edit_details.dart';
import 'package:student_records/view/view_details/widgets/custom_container.dart';

class ViewDetails extends StatelessWidget {
  final String image;
  final String name;
  final String age;
  final String domain;
  final String batch;
  final int? id;
  const ViewDetails({
    super.key,
    this.id,
    required this.name,
    required this.age,
    required this.domain,
    required this.batch,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        backgroundColor: ktheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight30,
            Center(
              child: CircleAvatar(
                backgroundImage: image == null
                    ? AssetImage('images/user.png')
                    : FileImage(File(image)) as ImageProvider,
                radius: 80,
              ),
            ),
            kheight30,
            Container(
              height: 365,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: ktheme),
              child: Column(
                children: [
                  kheight10,
                  CustomContainer(
                    keyText: 'Name ',
                    valueText: name,
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Age ',
                    valueText: age,
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Domain',
                    valueText: domain,
                  ),
                  kheight10,
                  CustomContainer(
                    keyText: 'Batch',
                    valueText: batch,
                  ),
                  kheight20,
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(kwhite)),
                    onPressed: () {
                      final student = StudentModel(
                        image: image,
                        id: id,
                        name: name,
                        age: age,
                        domain: domain,
                        batch: batch,
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => EditDetails(model: student)));
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(color: kblack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
