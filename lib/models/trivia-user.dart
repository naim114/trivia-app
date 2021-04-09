import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TriviaUser {
  @HiveField(0)
  String name;

  @HiveField(1)
  String pasword;

  @HiveField(2)
  List<String> quizzes;
  TriviaUser({
    required this.name,
    required this.pasword,
    required this.quizzes,
  });
}
