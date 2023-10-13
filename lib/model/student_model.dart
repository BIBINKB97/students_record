import 'package:hive/hive.dart';
    part 'student_model.g.dart'; 

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String domain;

  @HiveField(3)
  final String batch;

  StudentModel({
    required this.name,
    required this.age,
    required this.domain,
    required this.batch,
  });
}
