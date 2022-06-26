import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/model/games/BalanceGame.dart';
import 'package:hay_project/model/games/StartGame.dart';
import 'package:hay_project/view/games/ToggleButton.dart';

class StartGamePage extends StatefulWidget {
  GameController gameController;
  StartGamePage({Key? key, required this.gameController}) : super(key: key);

  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {
  late StartGame startGame;
  bool isToggled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isToggled = false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StartGame>(
        future: widget.gameController.loadRandomStartGame(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasError) {
            startGame = snapshot.data!;
            return Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 40),
                        width: 303,
                        height: 191,
                        alignment: Alignment.center,
                        child: Text(
                          "초성이 들어가는 단어를 \n돌아가면서 말해보세요!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )),
                    ToggleButton(
                      isToggled: false,
                      gameTitle: 'start',
                      data: startGame,
                    )
                  ],
                )),
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 130,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffffc93c)),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        startGame =
                            await widget.gameController.loadRandomStartGame();
                        setState(() {
                          isToggled = false;
                        });
                      },
                      child: Image.asset("image/GameIcons/CallRandom.png"),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text("데이터가 없습니다."),
            );
          }
        });
  }
}
