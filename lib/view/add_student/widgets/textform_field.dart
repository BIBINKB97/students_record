import 'package:flutter/material.dart';
import 'package:student_records/utils/constants.dart';

class TextForm extends StatelessWidget {
  final String hintTxt;
  final int? maxLength;
  final TextInputType keyboardtype;
  final TextEditingController controller;
  final String Function(String?)? validator;
  const TextForm({
    super.key,
    required this.hintTxt,
    required this.controller,
    this.maxLength,
    required this.keyboardtype,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            validator: validator,
            keyboardType: keyboardtype,
            maxLength: maxLength,
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
