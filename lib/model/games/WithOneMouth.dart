import 'package:hay_project/model/games/Game.dart';

class WithOneMouth extends Game {
  WithOneMouth(
      {required int id,
      required String category,
      required this.word1,
      required this.word2})
      : super(id, category);
  final String word1;
  final String word2;
}
