import 'package:flutter/material.dart';
import 'package:hay_project/model/games/BalanceGame.dart';

class BalanceGameCard extends StatefulWidget {
  int id;
  int onClick;
  BalanceGame balanceGame;
  BalanceGameCard(
      {Key? key,
      required this.id,
      required this.onClick,
      required this.balanceGame})
      : super(key: key);

  @override
  _BalanceGameCardState createState() => _BalanceGameCardState();
}

class _BalanceGameCardState extends State<BalanceGameCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          onPressed: () {
            setState(() {
              widget.onClick = 1;
            });
          },
          child: Container(
              margin: EdgeInsets.only(top: 40),
              width: 303,
              height: 191,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.onClick != 1 ? Colors.white : Color(0xffFFC93C),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                widget.balanceGame.solution1,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: Text("VS",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              widget.onClick = 2;
            });
          },
          child: Container(
              width: 303,
              height: 191,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.onClick != 2 ? Colors.white : Color(0xffFFC93C),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                widget.balanceGame.solution2,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }
}
