import 'package:flutter/material.dart';
import 'package:student_records/model/student_model.dart';

class ProviderClass with ChangeNotifier {
  List<StudentModel> studentList = [];
  List<StudentModel> studentSearchResult = [];
}
