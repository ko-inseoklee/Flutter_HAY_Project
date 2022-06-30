import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final int idx;
  const ProgressIndicatorComponent({Key? key,required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 22,
          padding: EdgeInsets.all(2),
          child: Text('1',style: TextStyle(color: idx == 0? Colors.white: Color(0xffCCCCCC)),),
          decoration: BoxDecoration(
              border: Border.all(color: idx == 0? Colors.white: Color(0xffCCCCCC)),
              color: idx == 0? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(250)
          ),
        ),
        Container(
          child: Icon(Icons.remove, color: Color(0xffCCCCCC),),
        ),
        Container(
          alignment: Alignment.center,
          width: 22,
          padding: EdgeInsets.all(2),
          child: Text('2',style: TextStyle(color: idx == 1? Colors.white: Color(0xffCCCCCC)),),
          decoration: BoxDecoration(
              border: Border.all(color: idx == 1? Colors.white: Color(0xffCCCCCC)),
              color: idx == 1? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(250)
          ),
        ),
        Container(
          child: Icon(Icons.remove, color: Color(0xffCCCCCC),),
        ),
        Container(
          alignment: Alignment.center,
          width: 22,
          padding: EdgeInsets.all(2),
          child: Text('3',style: TextStyle(color: idx == 2? Colors.white: Color(0xffCCCCCC)),),
          decoration: BoxDecoration(
              border: Border.all(color: idx == 2? Colors.white: Color(0xffCCCCCC)),
              color: idx == 2? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(250)
          ),
        ),
        Container(
          child: Icon(Icons.remove, color: Color(0xffCCCCCC),),
        ),
        Container(
          alignment: Alignment.center,
          width: 22,
          padding: EdgeInsets.all(2),
          child: Text('4',style: TextStyle(color: idx == 3? Colors.white: Color(0xffCCCCCC)),),
          decoration: BoxDecoration(
              border: Border.all(color: idx == 3? Colors.white: Color(0xffCCCCCC)),
              color: idx == 3? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(250)
          ),
        ),
      ],
    );
  }
}
