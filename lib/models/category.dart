import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final String category;

  @HiveField(2)
  final List<String> quiz;

  Category(
    this.category,
    this.quiz,
  );
}
