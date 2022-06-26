import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hay_project/view/communication/CommunicationQuestion.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';

class CommunicationPage extends StatefulWidget {
  CommunicationPage({Key? key}) : super(key: key);

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  List<String> categories = ["나", "가치", "가족", "상상", "일상", "과거", "미래", "관계"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff40A8C4),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [Color(0xff07689F), Color(0xff71BACD)])),
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommunicationQuestion(
                                    communicationTitle: categories[index],
                                  )));
                    },
                    child: Container(
                      height: 285,
                      width: 195,
                      margin: EdgeInsets.symmetric(horizontal: 27.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 170,
                            color: Colors.white,
                          ),
                          Container(
                            width: 190,
                            height: 245,
                            decoration: BoxDecoration(
                                color: Color(0xffffc93c).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 40),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )),
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (detail){
        print("start: $detail");
      },
      onHorizontalDragUpdate: (detail){
        print("update : $detail");
      },
      onTap: (){
        print("onTap");
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(),
    );
  }*/
}
