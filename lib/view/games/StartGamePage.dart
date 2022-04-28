import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/model/games/BalanceGame.dart';
import 'package:hay_project/model/games/StartGame.dart';

class StartGamePage extends StatefulWidget {
  GameController gameController;
  StartGamePage({Key? key, required this.gameController}) : super(key: key);

  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {
  late StartGame startGame;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StartGame>(
        future: widget.gameController.loadRandomStartGame(),
        builder: (context, snapshot){
          if(snapshot.hasData == false){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasError){
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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Text(startGame.question,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          child: Text("VS",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600, color: Colors.white)),
                        ),
                        Container(
                            width: 303,
                            height: 191,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Text(startGame.example,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)
                        ),
                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 130,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffffc93c)
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        startGame = await widget.gameController.loadRandomStartGame();
                        setState(() {
                        });
                      },
                      child: Image.asset("image/GameIcons/CallRandom.png"),
                    ),
                  ),
                ),
              ],
            );
          }
          else{
            return Center(
              child: Text("데이터가 없습니다."),
            );
          }
        }
    );
  }
}
