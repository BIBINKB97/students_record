import 'package:flutter/material.dart';
import 'package:student_records/utils/constants.dart';

class TextForm extends StatelessWidget {
  final String hintTxt;
  final TextEditingController controller;
  const TextForm({
    super.key,
    required this.hintTxt,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintTxt,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
        ),
        kheight20,
      ],
    );
  }
}
