import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/view/games/GameContainer.dart';

class GameCard extends StatelessWidget {
  final String gameTitle;
  final String imagePath;
  const GameCard({Key? key,required this.gameTitle, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GameContainer(gameTitle: gameTitle,) ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        alignment: Alignment.bottomCenter,
        width: 375,
        height: 134.16,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath)
          )
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0))
          ),
          padding: EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          width: 375,
          height: 50,
          child: Text(gameTitle,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600, color: Colors.white),),
          ),
        ),
    );
  }
}
