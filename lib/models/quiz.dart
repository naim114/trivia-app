import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Quiz {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  List<Map<String, Map<String, bool>>> questions;

  @HiveField(3)
  String user;

  @HiveField(4)
  double score;

  @HiveField(5)
  bool isRandom;

  @HiveField(6)
  String difficulty;

  @HiveField(7)
  int questionNum;

  // List shuffle(List items) {
  //   var random = new Random();

  //   // Go through all elements.
  //   for (var i = items.length - 1; i > 0; i--) {

  //     // Pick a pseudorandom number according to the list length
  //     var n = random.nextInt(i + 1);

  //     var temp = items[i];
  //     items[i] = items[n];
  //     items[n] = temp;
  //   }

  //   return items;
  // }

  Quiz({
    required this.title,
    required this.category,
    required this.questions,
    required this.user,
    required this.score,
    required this.isRandom,
    required this.difficulty,
    required this.questionNum,
  });

  Quiz copyWith({
    String? title,
    String? category,
    List<Map<String, Map<String, bool>>>? questions,
    String? user,
    double? score,
    bool? isRandom,
    String? difficulty,
    int? questionNum,
  }) {
    return Quiz(
      title: title ?? this.title,
      category: category ?? this.category,
      questions: questions ?? this.questions,
      user: user ?? this.user,
      score: score ?? this.score,
      isRandom: isRandom ?? this.isRandom,
      difficulty: difficulty ?? this.difficulty,
      questionNum: questionNum ?? this.questionNum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'questions': questions,
      'user': user,
      'score': score,
      'isRandom': isRandom,
      'difficulty': difficulty,
      'questionNum': questionNum,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      title: map['title'],
      category: map['category'],
      questions: List<Map<String, Map<String, bool>>>.from(
          map['questions']?.map((x) => x)),
      user: map['user'],
      score: map['score'],
      isRandom: map['isRandom'],
      difficulty: map['difficulty'],
      questionNum: map['questionNum'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(title: $title, category: $category, questions: $questions, user: $user, score: $score, isRandom: $isRandom, difficulty: $difficulty, questionNum: $questionNum)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quiz &&
        other.title == title &&
        other.category == category &&
        listEquals(other.questions, questions) &&
        other.user == user &&
        other.score == score &&
        other.isRandom == isRandom &&
        other.difficulty == difficulty &&
        other.questionNum == questionNum;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        category.hashCode ^
        questions.hashCode ^
        user.hashCode ^
        score.hashCode ^
        isRandom.hashCode ^
        difficulty.hashCode ^
        questionNum.hashCode;
  }
}
