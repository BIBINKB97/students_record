// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_records/model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('STDB');
  final id = await studentDb.add(value);
  value.id = id;
}

Future<void> getAllStudents() async {
  final studendDb = await Hive.openBox<StudentModel>('STDB');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studendDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteData(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('STDB');
  await studentDb.delete(id);
  getAllStudents();
}

Future<void> updateData(StudentModel model) async {
  final studentDb = await Hive.openBox<StudentModel>('STDB');
  await studentDb.put(model.id, model);
}

Future<void> search(String text) async {
  final studentDb = await Hive.openBox<StudentModel>('STDB');
  studentListNotifier.value.clear();
  studentListNotifier.value
      .addAll(studentDb.values.where((element) => element.name.contains(text)));
  studentListNotifier.notifyListeners();
}
