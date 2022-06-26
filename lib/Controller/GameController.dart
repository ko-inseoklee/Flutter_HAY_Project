import 'package:dio/dio.dart';
import 'package:hay_project/Controller/BaseController.dart';
import 'package:hay_project/model/games/BalanceGame.dart';
import 'package:hay_project/model/games/OXQuiz.dart';
import 'package:hay_project/model/games/Quiz.dart';
import 'package:hay_project/model/games/StartGame.dart';
import 'package:hay_project/model/games/WithOneMouth.dart';

class GameController extends BaseController {
  final String path = "games";

  Future<BalanceGame> loadRandomBalanceGame() async {
    Response response = await dio.get("$baseUrl/$path/balance-game/random");
    Map<String, dynamic> json = response.data["data"];
    return new BalanceGame(
        id: json["id"],
        category: json["category"].toString(),
        solution1: json["solution1"].toString(),
        solution2: json["solution2"].toString());
  }

  Future<StartGame> loadRandomStartGame() async {
    Response response = await dio.get("$baseUrl/$path/start-game/random");
    Map<String, dynamic> json = response.data["data"];
    return new StartGame(
        id: json["id"],
        category: json["category"].toString(),
        question: json["question"].toString(),
        example: json["example"]);
  }

  Future<WithOneMouth> loadRandomWOMGame() async {
    Response response = await dio.get("$baseUrl/$path/with-one-mouth/random");
    Map<String, dynamic> json = response.data["data"];
    return new WithOneMouth(
        id: json["id"],
        category: "초성게임",
        word2: json["words2"].toString(),
        word1: json["words1"].toString());
  }

  Future<OXQuiz> loadRandomOXQuizGame() async {
    Response response = await dio.get("$baseUrl/$path/ox-quiz/random");
    Map<String, dynamic> json = response.data["data"];
    bool answer = json["answer"];
    return new OXQuiz(
        id: json["id"],
        category: "OX퀴즈",
        question: json["question"].toString(),
        answer: answer);
  }

  Future<Quiz> loadRandomQuizGame() async {
    Response response = await dio.get("$baseUrl/$path/quiz/random");
    Map<String, dynamic> json = response.data["data"];
    return new Quiz(
        id: json["id"],
        category: "퀴즈",
        question: json["question"].toString(),
        answer: json["answer"].toString());
  }
}
