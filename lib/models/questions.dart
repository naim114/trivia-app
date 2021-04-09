import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Quiz {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  List<Map<String, Map<bool, String>>> questions;

  Quiz({
    required this.title,
    required this.category,
    required this.questions,
  });
}
