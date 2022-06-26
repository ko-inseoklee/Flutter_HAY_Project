import 'package:hay_project/model/games/Game.dart';

class Quiz extends Game {
  Quiz(
      {required int id,
      required String category,
      required this.question,
      required this.answer})
      : super(id, category);
  final String question;
  final String answer;
}
