import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String domain;
  @HiveField(3)
  final String batch;
  @HiveField(4)
  final String name;


  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.domain,
    required this.batch,
  });
}
