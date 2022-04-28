import 'package:hay_project/model/games/Game.dart';

class OXQuiz extends Game{
  OXQuiz({required int id,required String category,required this.question,required this.answer}) : super(id, category);
  final String question;
  final bool answer;
}