import 'package:flutter/material.dart';
import 'package:student_records/utils/constants.dart';

class TextForm extends StatelessWidget {
  final String hintTxt;
  const TextForm({super.key, required this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
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
