import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hay_project/view/profile/signUp/ProgressIndicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class TOSPage extends StatefulWidget {
  TOSPage({Key? key}) : super(key: key);

  @override
  _TOSPageState createState() => _TOSPageState();
}

class _TOSPageState extends State<TOSPage> {
  bool tos = false;
  bool personal = false;
  bool entire = false;



  Future<String> loadAsset(String fileName) async {
    return await rootBundle.loadString('resource/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                    alignment: Alignment.topLeft,
                    child: ButtonTheme(
                      padding: EdgeInsets.zero,
                      child: FlatButton(
                        onPressed: (){
                          Get.back();
                          },
                        child: Icon(Icons.arrow_back_ios,size: 16,),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right:20),
                    child: ProgressIndicatorComponent(idx: 0,),
                  ),
                  Container(
                  ),
                ],
              ),),
            Container(
              padding: EdgeInsets.only(left: 33,top: 15, right: 33),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 33),
                    child: Text("이용 약관 동의",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                  ),
                  Container(
                    width: 347, height: 57,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(entire? 0xff07689F : 0xfff3f3f6)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11.0),
                                )
                            )
                        ),
                      onPressed: () async{
                        setState(() {
                          entire = !entire;
                          tos = entire;
                          personal = entire;
                        });
                      },
                      child: Text("모두 동의합니다.", style:TextStyle(color: entire? Colors.white: Color(0xffCCCCCC))),
                    )
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          tos = !tos;
                          entire = personal && tos;
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(Icons.done, color: tos? Color(0xff07689F) : Color(0xfff3f3f6),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16,top: 10),
                            child: Text("이용약관(필수)",style: TextStyle(color: Colors.black),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffF3F3F6))
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: FutureBuilder(
                        future: loadAsset('tos1.txt'),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState == ConnectionState.none){
                            return CircularProgressIndicator();
                          } else if (!snapshot.hasData) {
                            return Text("File is not exist.");
                          } else {
                            return Container(
                              padding: EdgeInsets.all(5),
                                child: Text(snapshot.data)
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          personal = !personal;
                          entire = personal && tos;
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 28.0),
                            child: Icon(Icons.done, color: personal? Color(0xff07689F) : Color(0xfff3f3f6),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16,top: 28),
                            child: Text("개인정보 수집 및 이용 동의(필수)", style: TextStyle(color: Colors.black),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffF3F3F6))
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: FutureBuilder(
                        future: loadAsset('tos2.txt'),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState == ConnectionState.none){
                            return CircularProgressIndicator();
                          } else if (!snapshot.hasData) {
                            return Text("File is not exist.");
                          } else {
                            return Container(
                                padding: EdgeInsets.all(5),
                                child: Text(snapshot.data)
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                      width: 347, height: 57,
                      margin: EdgeInsets.only(top: 15),
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(entire? 0xff07689F : 0xfff3f3f6)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11.0),
                                )
                            )
                        ),
                        onPressed: () async{
                          //TODO: Navigate to next Page.
                        },
                        child: Text("동의합니다.", style:TextStyle(color: entire? Colors.white: Color(0xffCCCCCC))),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
