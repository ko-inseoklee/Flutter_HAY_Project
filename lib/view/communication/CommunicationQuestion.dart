import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_project/ignore.dart';

class CommunicationQuestion extends StatefulWidget {
  final String communicationTitle;
  CommunicationQuestion({Key? key, required this.communicationTitle})
      : super(key: key);

  @override
  _CommunicationQuestionState createState() => _CommunicationQuestionState();
}

class _CommunicationQuestionState extends State<CommunicationQuestion> {
  String? question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.communicationTitle,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff07689F),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff40A8C4),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 278,
              height: 392,
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(24),
                    width: 229,
                    height: 255,
                    decoration: BoxDecoration(
                      color: Color(0xffFBE6E0),
                      image: DecorationImage(
                          image: AssetImage(
                              "image/CommunicationIcons/ComImage.png")),
                    ),
                  ),
                  Container(
                    width: 270,
                    height: 60,
                    child: FutureBuilder(
                      future: getCommunicationTopic(widget.communicationTitle),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.none) {
                          return CircularProgressIndicator();
                        } else if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          question = snapshot.data;

                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                question!,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 130,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffffc93c)),
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  question =
                      await getCommunicationTopic(widget.communicationTitle);
                  setState(() {});
                },
                child: Image.asset("image/GameIcons/CallRandom.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getCommunicationTopic(String category) async {
    Response response =
        await Dio().get("$serverUrl/communication/$category/random");

    Map<String, dynamic> json = response.data["data"];
    return json["question"];
  }
}
