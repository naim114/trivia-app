import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Quiz {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  List<Map<String, Map<bool, String>>> questions;

  @HiveField(3)
  String user;

  @HiveField(4)
  double score;

  @HiveField(5)
  bool isRandom;

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
  });
}
