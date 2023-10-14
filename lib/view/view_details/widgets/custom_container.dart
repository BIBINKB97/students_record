import 'package:flutter/material.dart';
import 'package:student_records/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final String keyText;
  final String valueText;
  const CustomContainer({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: kwhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            keyText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          VerticalDivider(
            indent: 15,
            endIndent: 15,
            color: ktheme,
            thickness: 1.5,
          ),
          Text(
            valueText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
