import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/Controller/GameController.dart';
import 'package:hay_project/model/games/BalanceGame.dart';
import 'package:hay_project/view/games/BalanceGameCard.dart';

class BalanceGamePage extends StatefulWidget {
  GameController gameController;
  BalanceGamePage({Key? key, required this.gameController}) : super(key: key);

  @override
  _BalanceGamePageState createState() => _BalanceGamePageState();
}

class _BalanceGamePageState extends State<BalanceGamePage> {
  late BalanceGame balanceGame;
  int onClick = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onClick = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BalanceGame>(
      future: widget.gameController.loadRandomBalanceGame(),
      builder: (context, snapshot){
        if(snapshot.hasData == false){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(!snapshot.hasError){
          balanceGame = snapshot.data!;
          return Column(
            children: [
              Expanded(
                  child: BalanceGameCard(balanceGame: balanceGame,id: 0,onClick: onClick,)
              ),
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
                      color: Color(0xffffc93c)
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      balanceGame = await widget.gameController.loadRandomBalanceGame();
                      setState(() {
                        onClick = 0;
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
