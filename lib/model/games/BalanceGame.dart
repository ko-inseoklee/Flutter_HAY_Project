import 'Game.dart';

class BalanceGame extends Game {
  BalanceGame(
      {required int id,
      required String category,
      required this.solution1,
      required this.solution2})
      : super(id, category);

  final String solution1;
  final String solution2;
}
