import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  bool isToggled;
  final String gameTitle;
  final dynamic data;
  ToggleButton(
      {Key? key, required this.isToggled, required this.gameTitle, this.data})
      : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          widget.isToggled = !widget.isToggled;
        });
      },
      child: Container(
          width: 303,
          height: widget.gameTitle == "start" ? 303 : 202,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: !widget.isToggled ? Colors.white : Color(0xffFFC93C),
              borderRadius: BorderRadius.circular(16)),
          child: textByTitle(widget.gameTitle)),
    );
  }

  Widget textByTitle(String title) {
    if (widget.gameTitle == "start") {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          !widget.isToggled ? widget.data.question : widget.data.example,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      );
    } else if (widget.gameTitle == "quiz") {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          !widget.isToggled ? "정답보기" : widget.data.answer,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      );
    }
    // OX
    else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          !widget.isToggled
              ? "정답보기"
              : widget.data.answer
                  ? "O"
                  : "X",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      );
    }

    return Text("");
  }
}
