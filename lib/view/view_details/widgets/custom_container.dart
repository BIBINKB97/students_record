import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: kwhite),
    );
  }
}
