import 'package:hay_project/model/games/Game.dart';

class StartGame extends Game{
  StartGame({required int id,required String category,required this.question,required this.example}) : super(id, category);
  final String question;
  final String example;
}